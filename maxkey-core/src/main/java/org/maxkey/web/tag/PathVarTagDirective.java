/*
 * Copyright [2020] [MaxKey of copyright http://www.maxkey.top]
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 

package org.maxkey.web.tag;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
    *   获取应用上下文标签
 *   <@pathVar/>
 * @author Crystal.Sea
 *
 */

@FreemarkerTag("pathVar")
public class PathVarTagDirective implements TemplateDirectiveModel {
	@Autowired
    private HttpServletRequest request;
	
	private int index;
	String pathVariable;

	@Override
	@SuppressWarnings("rawtypes")
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body)
			throws TemplateException, IOException {
		
		index=Integer.parseInt(params.get("index").toString());
		String[] pathVariables=request.getAttribute(org.springframework.web.util.WebUtils.FORWARD_REQUEST_URI_ATTRIBUTE).toString().split("/");
		
		if(pathVariables==null){
			pathVariables=request.getRequestURI().split("/");
		}
		
		if(index==0){
			pathVariable=pathVariables[pathVariables.length-1];
		}else{
			pathVariable=pathVariables[index+1];
		}
			env.getOut().append(request.getParameter(pathVariable));
	}

}
