/*
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 * The full license can be found online at http://www.gnu.org/copyleft/gpl.html
 *
 */

package co.paulozan.rest;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.StringWriter;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class DefinitionParser {

  public static String parse(String word, String definition) throws Exception {
    ClassLoader classLoader = DefinitionParser.class.getClassLoader();
    InputStream input = classLoader.getResourceAsStream("definition.xslt");

    TransformerFactory transformerFactory = TransformerFactory.newInstance();
    Templates template = transformerFactory
        .newTemplates(new StreamSource(input));
    Transformer transformer = template.newTransformer();
    transformer.setParameter("word_definition", word);

    Source source = new StreamSource(new ByteArrayInputStream(definition.getBytes()));
    StringWriter writer = new StringWriter();
    Result result = new StreamResult(writer);

    transformer.transform(source, result);

    return writer.toString();
  }


}
