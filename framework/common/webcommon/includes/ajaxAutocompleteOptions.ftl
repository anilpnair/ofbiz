<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<#if description?exists>
    <#if autocompleteOptions?exists>
        <#list autocompleteOptions as autocompleteOption>
            <#assign displayString = ""/>
            <#list displayFieldsSet as key>
                <#assign field = autocompleteOption.get(key)?if_exists>
                <#if field?has_content>
                    <#if (key != context.returnField)>
                        <#assign displayString = displayString + field + " ">
                    </#if>
                </#if>
            </#list>
            <#if (displayString?trim?has_content )>${displayString?trim}</#if>
        </#list>
    </#if>
<#else>
<script type="text/javascript">
    <#if autocompleteOptions?exists>
  var autocomp = [
        <#if !displayReturnField?exists>
            <#assign displayReturnField = Static["org.ofbiz.base.util.UtilProperties"].getPropertyValue("widget.properties", "widget.autocompleter.displayReturnField")>
        </#if>
        <#list autocompleteOptions as autocompleteOption>
            {
            <#assign displayString = ""/>
            <#assign returnField = ""/>
            <#list displayFieldsSet as key>
              <#assign field = autocompleteOption.get(key)?if_exists>
              <#if field?has_content>
                  <#if (key == context.returnField)>
                      <#assign returnField = field/>
                  <#else>
                      <#assign displayString = displayString + StringUtil.wrapString(field) + " ">
                  </#if>
              </#if>
            </#list>
            <#if ("Y" == displayReturnField)>
                <#assign displayString = displayString +  "[" + returnField + "]">
            </#if>
            "id": " ${returnField}",
            "label": "<#if (displayString?trim?has_content )>${displayString?trim}<#else>${returnField}</#if>",
            "value": "${returnField}"
            }<#if autocompleteOption_has_next>,</#if>
        </#list>
  ];
    </#if>
</script>
</#if>
