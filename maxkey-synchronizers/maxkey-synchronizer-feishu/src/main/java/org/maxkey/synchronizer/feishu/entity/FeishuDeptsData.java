/*
 * Copyright [2022] [MaxKey of copyright http://www.maxkey.top]
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

package org.maxkey.synchronizer.feishu.entity;

import java.util.ArrayList;

import org.maxkey.synchronizer.entity.ResponseData;

public class FeishuDeptsData extends ResponseData {

	boolean has_more;
	String page_token;
	ArrayList<FeishuDepts> items;

	public boolean isHas_more() {
		return has_more;
	}

	public void setHas_more(boolean has_more) {
		this.has_more = has_more;
	}

	public String getPage_token() {
		return page_token;
	}

	public void setPage_token(String page_token) {
		this.page_token = page_token;
	}

	public ArrayList<FeishuDepts> getItems() {
		return items;
	}

	public void setItems(ArrayList<FeishuDepts> items) {
		this.items = items;
	}

	public FeishuDeptsData() {
		super();
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FeishuDeptsResponse [has_more=");
		builder.append(has_more);
		builder.append(", page_token=");
		builder.append(page_token);
		builder.append(", items=");
		builder.append(items);
		builder.append("]");
		return builder.toString();
	}

}
