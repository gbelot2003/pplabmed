package pplabmed.controller;

import java.io.File;
import java.io.IOException;
import java.security.KeyStore.Entry.Attribute;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.io.InputStream;
import java.io.OutputStream;
import com.jcraft.jsch.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.Properties;
import javax.swing.*;
import modelo.util.HibernateUtil;

@Controller
public class patologiaController {

    @RequestMapping(value = "cargarxml.htm")
    public String cargarXml(Model m, HttpServletRequest request) throws JSchException, SftpException {
        ArrayList<String> archivos = new ArrayList<String>();
        try {
            JSch jsch = new JSch();
            String host = "190.109.192.59";
            String user = "root";
            int port = 22;
            Session session = jsch.getSession(user, host, port);
            // username and password will be given via UserInfo interface.
            session.setPassword("labmedicos2016!");
            Properties prop = new Properties();
            prop.put("StrictHostKeyChecking", "no");
            session.setConfig(prop);
            session.connect();
            Channel channel = session.openChannel("sftp");
            channel.connect();
            ChannelSftp c = (ChannelSftp) channel;
            c.cd("/home/cust/HansaWorld/sinergia");
            String ruta = HibernateUtil.class.getResource("/../../").getPath() + "xml_files/";
            ruta = ruta.replace("%20", " ");
            System.out.println(ruta);
            try {
                java.util.Vector vv = c.ls("/home/cust/HansaWorld/sinergia");
                if (vv != null) {
                    for (int ii = 0; ii < vv.size(); ii++) {
//                           out.println(vv.elementAt(ii).toString());
                        Object obj = vv.elementAt(ii);
                        if (obj instanceof com.jcraft.jsch.ChannelSftp.LsEntry) {
                            if (((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getLongname().endsWith(".xml")) {
                                archivos.add(((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getLongname());
                                System.out.println("Agrego: " + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename());
                                c.get("/home/cust/HansaWorld/sinergia/" + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename(), ruta + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename());

                                //c.get("/home/cust/HansaWorld/sinergia/" + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename(),"/home/cust/HansaWorld/sinergia/cargados/" + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename());
                                System.out.println("Agrego: " + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename());
                                //*String sDirectorio = "C:\\Users\\SinergiaPC\\Desktop\\xml_facturas\\ficheros Nuevos\\";
                                System.out.println(ruta + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename());
                                SAXBuilder builder = new SAXBuilder();
                                File xmlFile = new File(ruta + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename());
                                /* File xmlFile = new File("C:\\Users\\SinergiaPC\\Desktop\\xml_facturas\\ficheros Nuevos\\" + ficheros[x].getName());*/
                                try {
                                    Document document = (Document) builder.build(xmlFile);
                                    Element rootNode = document.getRootElement();
                                    String numfact = rootNode.getChildTextTrim("num_factura");
                                    String numcedula = rootNode.getChildTextTrim("num_cedula");
                                    String nomcliente = rootNode.getChildTextTrim("nombre_completo_cliente");
                                    String fechanac = rootNode.getChildTextTrim("fecha_nacimiento");
                                    String correo = rootNode.getChildTextTrim("correo");
                                    String sede = rootNode.getChildTextTrim("direccion_entrega_sede");
                                    String medico = rootNode.getChildTextTrim("medico");
                                    String status = rootNode.getChildTextTrim("status");
                                    String sexo = rootNode.getChildTextTrim("sexo");
                                    System.out.println("\t Nombre " + nomcliente);
                                    System.out.println("\t fecha " + fechanac);
                                    System.out.println("\t correo " + correo);
                                    System.out.println("\t Medico " + medico);
                                    System.out.println("\t Estatus " + status);
                                    System.out.println("\t Sexo " + sexo);
                                    //Element roodNode = document.getRootElement();
                                    //List list2 = rootNode.getChildren("examenes");
                                    Element apiName = rootNode.getChild("examenes");
                                    List list2 = apiName.getChildren("nombre_examen");
                                    System.out.println("\t tamaño lista " + list2.size());
                                    List<Element> typeContent = rootNode.getChildren("examenes");
                                    for (int i = 0; i < typeContent.size(); i++) {
                                        //List<Element> list = typeContent.getChildren("nombre_examen");
                                        if (typeContent.size() > 0) {
                                            Element element = typeContent.get(i);
                                            List paramChilds = element.getChildren("nombre_examen");
                                            for (int j = 0; j < paramChilds.size(); j++) {
                                                Element node = (Element) paramChilds.get(j);
                                                System.out.println("\t Examenes:" + node.getText());
                                            }
                                        }
                                    }

                                } catch (IOException io) {
                                    System.out.println(io.getMessage());
                                } catch (JDOMException jdomex) {
                                    System.out.println(jdomex.getMessage());
                                }
                                c.put(ruta + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename(), "/home/cust/HansaWorld/sinergia/cargados/");
                                c.rm("/home/cust/HansaWorld/sinergia/cargados/" + ((com.jcraft.jsch.ChannelSftp.LsEntry) obj).getFilename());
                            }
                        }
                    }
                }
            } catch (SftpException e) {
                System.out.println(e.toString());
            }
        } catch (JSchException js) {
            System.out.println(js.toString());
        }
        return "principal";
    }
}
