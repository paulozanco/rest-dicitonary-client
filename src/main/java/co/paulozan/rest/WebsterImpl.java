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

import feign.Feign;
import feign.Logger.Level;
import feign.slf4j.Slf4jLogger;

public class WebsterImpl {

  /**
   * Return a definition in English for the specific word from Merriam Webster - Collegiate.
   * It is mandatory to get the collegiate key from Developer Center </http://dictionaryapi.com>
   *
   * @param word - used to search dictionary and get the definition
   * @param key - collegiate key supplied by Merrian Webster after sign up
   * @return search results in XML format
   */
  public String definition(String word, String key) throws Exception {

    Webster webster = Feign.builder()
        .logger(new Slf4jLogger())
        .logLevel(Level.FULL)
        .target(Webster.class, "http://www.dictionaryapi.com");
    String definition = webster.definition(word, key);
    System.out.println("word = [" + word + "], key = [" + key + "]");

    return DefinitionParser.parse(word, definition);

  }
}
