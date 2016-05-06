package com.sw.core.data.dbholder;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {

	/**
	 * 重写方法，获取数据库类型
	 */
	@Override
	protected Object determineCurrentLookupKey() {
		return DatasourceTypeContextHolder.getDataSourceType();
	}

}
