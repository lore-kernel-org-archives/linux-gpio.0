Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3CF45000;
	Wed, 16 Sep 2026 00:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789518054; cv=fail; b=PCsdI4KgxZ6fS4/YtutJANeRCzvr/KASJQ9kR7Aj75AM4wdWL63S/Q+0czJLehDG2onVham2LAbFFtdP4FaLo6bITAaj3gjgK9gBvG3E7WZyeCV+JyGjYb+Vg0RDqmUcF/XhEGhV0/ls4x4GcIfSOx2ouzRVB2Y1sYXesifDP3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789518054; c=relaxed/simple;
	bh=75xUJVOwSwbA5NwIGhyy/Rq7YeCAm+zb/EPa/ZbWU7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CYH0Ia07TXscKVKd7tuAsEv1tX2PWm/ntU4T9o+RByW8pW6qcwjBeJtiZVpvk5eT07Env3L5HSsb0AS/jq8NSN/aCEmMhZKOD9frpFj+MywsSU/59OODYOfKnRsY6mwvTZux85GtDPQJW3ASDqKJINNT5EaSN1yiD3zfU+mYEY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=1qfUXQiX; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="1qfUXQiX"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLXNuP2358727;
	Tue, 15 Sep 2026 20:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=GR1Yt8vtCM3ckF2LuDrVdxYIw1nJG
	KcpI8Tz8b3iH+8=; b=1qfUXQiXB3N5G3WsQgLYbbeAcjIxBnvd/zXDW6sTOY5FW
	Ss204pQvqezly8HcY9mVCiycaeih+NzOP2I0MUgIniNCqQZNxZ9/jGq8VX/0HucN
	AVzAV86vMxFRIZs8ZCGo7hldKkx6iJNuJpQDOJJ0YjHW2smnUBbZ6h/ecI1yElZS
	2NtFUf2U6uk9H15tjmIrQz5cF+lojjEmYZlNeGmKC16kTkiUz/vFjHthfNrG2fQh
	UfD8DnyYh6x96MVznAk33RZ3lORBi+IWxlOFGIp3BVlsbwTHsvbJMBiDe4Bylkrj
	AL0sq/riLUaSLTzjKcTcC9zlrF2DbvQaQH700bCLA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gq57ebhjs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 20:20:33 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLxS3CTSH712R7DP0jJ3Rnn1DlwDy63k6M5WnpgN8OJRdXJih66jLDMmbJOIglX4Ah5jSLw8H0xk4v8IegJnz3UoaTVJs25iC2rszzEEgln5rE2YzwO9amT6kF750wLQxilmmwd8yPS8J69pREJx+L1bHUeGMaixbwI4nnhmFj54JcEZaJkBBkK1vAsW/dX62AvoF6XSfF1tHUcwNkYSqwubqf0gmehkryIOLbnD+XxybTw2uUkh1bdBXzlTt4rQ2HuGCTqGUz6rXDlVJzH9ZcnWa/MRDcHkRkQK+RxOc0OtcXgCHGKWGg45/6vB8VlkHQhoLKq6B6gXzB8DewEU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR1Yt8vtCM3ckF2LuDrVdxYIw1nJGKcpI8Tz8b3iH+8=;
 b=PbXOPj0lFiNPY8YTc7nWn0lUu0jWooc+29wXT8uy3kEsX61JQ9IDwmzROugHhK5hEKajaNxRvFyCKiP9b2SCVU+AA/Auet74l8uvs6LheWQCl7Oma50A3ZmPtswkfSkQ3s9yTEfd9yMRiBAgu/ABrIkjBnJS7goBUvW37KCZ0V+lsOsFfNDZ8OChLlD50m7IdfoJxdp+TgBMXvsaQs+HBoI5/lLVVNDGtaa7qxC6Ul808/sX++FUJRnOY7RlaMfKv9mVUM5RC0KcCxQFIotMAcA8L3WMdSWVbjrSKQQmgR3uVNQPUra+4oiKz/GNyGbFpCsVzVWLgMD4pFH9cjR5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by EAYPR03MB840817.namprd03.prod.outlook.com (2603:10b6:303:2fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 00:20:31 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 00:20:30 +0000
Date: Wed, 16 Sep 2026 02:20:27 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: development@redaril.me
Cc: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        xu.yang_2@nxp.com
Subject: Re: [PATCH] mux: convert to use fwnode interface
Message-ID: <aqngNh-V7z3L2lP6@analog.com>
References: <20260915-mux_fwnode-v1-1-ed5a6d8202d4@redaril.me>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915-mux_fwnode-v1-1-ed5a6d8202d4@redaril.me>
X-ClientProxiedBy: AS4P191CA0019.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::9) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|EAYPR03MB840817:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8531f1-a3b5-41cc-336b-08df138850c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	wVtRGjgVkkGLqBDOTLf71+8fJyJQSvL7fMjV+Br/imCGfwnE7PE7R53KCZ7BGFlk37mZ59oUtyrdaEj853r3wszWKlW0waDCEmYajoXSzwBxR+IaKQ43qPRFRweEt8E466fXNsaIPKoqJMMUbYcRrozxnBLKAN2sI8JzHnCWdsm/T4IhWu5WZbNPsSq6R3GporrDTXCihVJ9UB41WY/9V56Xb/xYavnXwccjZSpk3QPZk0fkpRR51hz1LNgVXWM9bdSQY8Jbq3fDM36FIBSEr0reF0DQFTE+dR4AMcHWWugKelktowWN1+6SdbJHAjnNEvBiZk/mZZvBgjPof7+/n2sdJUTs0ZieJLgNLmBylcj9U3cJDFnJxf5k+MNK2NbLj/iOPv5Eq9PCysB2iWEalp24rXPoRYt5RAqG7uFki1bMcm/J+Hi2lndNzg5/XaXTGxBW64hIfEVr8iSpch9Vhx4jjYPu5ay8O77b1MnEXvKXVB+wKSJNnt7SEVX/LbS2uEPHoIAou+Q27c1nK3JR/WjlSqrZs9folifaOEKdN6AH/HONrmcAu8lLAc8m0wbI6eFWfUgbLWUagiMYFaodyyH7IQY4zGohWML5Q5hcR6YMX/SPGZsY5gMau8+A2DG4Mljm3MZhpshtiL8gNUhkkRYkhStMAtyLdg14eErKMRI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWt3VlZyaHZYSmYrVzJFdzF1UU1uNlViRDlkKzJ6MDdpc0xlU0xRUXYyaExv?=
 =?utf-8?B?UXFkR2xKalNUWVRRVWNXdUhQNzl1MUdCTVhiUkhKYkZrbzRqWnJsSUR0YUl1?=
 =?utf-8?B?dndXaGM0bm9IeGVDbHk5YTlqRzJsV2pTUGY0VWpFR0ZLdC9sR09EOUdQaTJi?=
 =?utf-8?B?L29tc3F2WStUNUtlVUlaTlpTOU4yaWNRbnVORGNzazJVVnQwU09hZ1RRdTZJ?=
 =?utf-8?B?RVVpMEdZOVVyQzNlM1dqNTZXYlZ0UnV1ZTRxcXZqN2k0T2FOUHpEOXVyNDV6?=
 =?utf-8?B?ZEo3S09mdU84eEdTRitnTW5STmc1Y0JkZDU2RTlXRVA1cXFrdTIwK1l0ekl2?=
 =?utf-8?B?ZkxJV1AvT1ZucEdkczdkUlB4NnFqTUFTdXVFT3EvMGVVL3cva1B0bEJLdXlI?=
 =?utf-8?B?cklSUDVKL3YzbXhpSkpDRFVqeHIzeWRGMDNJVUZHaUxWV1lzTXMyRklFZjlR?=
 =?utf-8?B?MURmTXp4NVl4RC9TSGZJZytqY3ZlQVlVaStON1VuMzR0YmZKUDlRcCtvNXk4?=
 =?utf-8?B?MGR4VXd1OHJmaTBtL2FyNlhJTXVBQXh5NjFKRE5yeDFhOVU1VkNsQXdnakpU?=
 =?utf-8?B?WGR0QlZ2ODVxUzhmWVhBcHBiK1U4ZGh3SVVveEtsMWFYeitZTHZ4SE9tNklO?=
 =?utf-8?B?aXRFdHFoSlg0YklkSXM1SkJEbEZ3UGFFbFFDRUFsbkdqeWp3U2hucXRwWUVN?=
 =?utf-8?B?Z3BmZ0ZpRTE0MWgzWVArWUNHOEU4cnJKV29ZVTdjUXBuVHgrb2ltalBzL1d4?=
 =?utf-8?B?RWlhWFNuWXRIVGFXUmpISTZJWUtuT0FieEMzTmhNYi9haTdiZG8zL2kxYlhT?=
 =?utf-8?B?bXFxOXFnUEtNZzNaMm15OU1BR3dvcTlMU0F3NzNKMExxam5CV3RaMGV3Wm9z?=
 =?utf-8?B?eDVPd0xyekRKN0FVNmd3YkgzaWFaWU5weXNBNWlkSG5jKzJpQlg4SThvOFJC?=
 =?utf-8?B?NVZ0ZXF0T2lzRTIrK3pxU3hYd1VWNkJvVThOVWUyWVFha3YxM0Vra3NhNUhH?=
 =?utf-8?B?VzFWQVBrRkJMTVNtWVVZQTZ4VDBBL0xNVTN2cDk3VkZ4RGJYcHhHRS9kQi9R?=
 =?utf-8?B?SUxyMlVpV2hjK1lieWhaN2pnZksvTFdCTEtvMWdrQ29aWTdQZVpvamc2eVYx?=
 =?utf-8?B?b3Z5VWdsK1RUaExJZ3IxTno3UXlVeUN2eWw4bW40T2tZTnVBRkU2M2prdWZM?=
 =?utf-8?B?eWJIVFFqdDNDbVRaUkhYa2kxWWdwVzVpWnJlNC84bzNXci8zVGVxcVY0cmxG?=
 =?utf-8?B?emU5RFpiTGdqRS9FWVlnd3ZrYklZZWNGTDJoak1yT0l0UmlCM05GZ1I1NW1X?=
 =?utf-8?B?QkRRdW5HM0hBK1RMcml4VGVOcmVyamlzY2IwTXhKTExKbnNtNStaTVJxMy9i?=
 =?utf-8?B?cXoxNEZjUlR5aS9la1dGNFV5UFNRbHY5S3lKRHVzWTJ2VlFtK2lucFY2QUpO?=
 =?utf-8?B?eTdyUm9ua0FIRjBBeElDbEozNnhLNHNZdks1VDdVVlM0cis3NlJCSE53eWxE?=
 =?utf-8?B?dXREcy9uMVdqY2o4OHlIKy9uU2Z6aDViZnF2QXpQUk5EVi96Smd3MzFRd3ZV?=
 =?utf-8?B?eG10QlkxRFhzWWl5NVFMeCtBZXVhUGgwSWY2V3RUMTM5TlJMa1l6RnN4Q2NG?=
 =?utf-8?B?NG1hdmE0alB3REZFdUkraXd5ZzBVMXBzanVSV1Qyb25NbG82Z0dzWFg0Qy9s?=
 =?utf-8?B?aHo3UjdBTkRYUnl4U0NwR2ZadlR3YUZ1dGtTeGsybUNYaTQrUVRFMG1NODQw?=
 =?utf-8?B?Q3BpMUNidzFheXBrNU83TUVobm5TQkNZVS9yWCtVWTN2Skg1Ly9FQktmaEg2?=
 =?utf-8?B?L2hXS0JlQUhnY2ZSbHgwL2VXM1pEdUxWcHFOUXRRaWh4dm1EUDUwWHRINXJp?=
 =?utf-8?B?ZmsxVHdDNDVZbkkxbjR6TVRIclVDdGZzQkw0VjNjb0xOR2ZLZHg3a3pVbzBq?=
 =?utf-8?B?VDlJVnVMUi9iREhNd1hPLzVKLzF0V00zQmVoNi9OTE5IU1Y1ZEQwSEpyRVpV?=
 =?utf-8?B?cDVPRE5IRTBPQS9tOTVlQUJ3NksvaCtFVTBmMjRjRWJtRU1FaTNXZ2Y4bm91?=
 =?utf-8?B?SVZ3NHBkNGdCeGZSeXo4M2JpUzNuYU4yT25wemVGVWFacEF5Q2tZeHpxTms0?=
 =?utf-8?B?M21PZklrb25Lei9EU3AydHcxdXhtZGMzcytraFExQmtMNXFPb0R4YmxoL0dq?=
 =?utf-8?B?YWF5WmJBTzBkVGdtb1VnTmUvVzVYVC80ZC8wU0ZRN3ViUWtOQXovNC9oWDFv?=
 =?utf-8?B?MmJ3QUNoTUNIZnRlSUVTdVBja2NKaW1xR1hYd1A5MXA4UTJtWDBrY3NuOTBw?=
 =?utf-8?B?NW5wZGhIbEZUVlkxVTB4SjgvY1l6QlBaeUFWVFVKTXVFRjNPWEQzQT09?=
X-Exchange-RoutingPolicyChecked:
	g3AITzJnGCwIFvl8K4HqJCbZdwJVc1H+ddcDStmIu4bm2VPYZHanny5CjGlUwawPlAA5qXypvRU4UczebVLhKaCZoaJWxePIlABRr1SnqutfWPLQOG7mCGlAeuxBDDgeceosD4OgOCsXamj6jk+NPTyCWB3qsJ+AZOYz4meCaK4TrWuGetNzryoggSKuhfyrQp+LIBGpW7tFvekhFiuJcQLNb6OU5FnNpHk3f4q1N8KN2bPqb/dz+WE6xX9lIX9DBEw/E2b1j4LBD2KoHQcYJv6bjE7+me9YfiSBiG2ZWSTQ4K5gwPEqYTTKbYQARURfzjK+FWwvOfhQHEh8K9XabA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8531f1-a3b5-41cc-336b-08df138850c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 00:20:30.5681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJrbeHw/kSfSGkZJXN/Xo4Hc5h/mJAxete41ASAzQ28SvYkfjSggbPMFLQn77aIkzX48bwGOQysFG9FEJQp/qrXEyATIJVX7QM65GlNgv5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB840817
X-Proofpoint-GUID: 4oPEdEwxe1DiedUbHLWxpCR_mcJtKV8I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAwMiBTYWx0ZWRfX2Tp2Mrqkk9rl
 aGPy16NK9KFMod83Fa6z/1MPVLnnmbdz3TynQcHISiU7pe/kX8fKaIWlRoD8+2IHqqd0v1ngpg6
 HyyA0bXTRk1pJRc7vQUamGnFlWONL4iAoNRAEuwo+qYnDcx7rRuu+/cI1QvIeZX2PblNTYNkakx
 XZwcAz1Os2OD8x5bDke7irj3nuhJ5LULSYow63Il+9r1uaYRhwZvXfEbRfoIJxo1Wxxygvfl0yM
 AYgcCMUoB4N7SNsx1z1Q9v/xkqfjyuV0v8tagFt0DIkwwQ7Yotzvxz3KJdhm1NLuZaPVQb+Sb8p
 HciksPKzN+sl6T4mXX6+GSRAvRGTVON4nHzcX02/8hktysSSY+QDvMsoSFOxeC60xD1zcSaRkty
 rBPWwpvxjjE4//NFipU89+PPncJH2LRHuNuO47LzqvNUlCqPb06ZF0xmYARZGN6EMWVYTMKUBgS
 MCWVTeftRgIkXJzTuzw==
X-Authority-Analysis: v=2.4 cv=V9HoQuni c=1 sm=1 tr=0 ts=6aa9e0d1 cx=c_pps
 a=ItoRIIcZIWT0tNr6APkIeA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=7sqpOg-GFVEJwLZeOrUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4oPEdEwxe1DiedUbHLWxpCR_mcJtKV8I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAwMiBTYWx0ZWRfX73zy56eWYxce
 tJ28pWYaRY3AgVAXt3wRkUxda2U3/XXwuRiVxNSWlSfai+H0uNeyoWDtWNNU6y0Zo5orfOH6Ukp
 UjRA+Kj1NEwEjIw1+WSOohjCPzDR6yNPE2yZimjOF78wJ7B2xVs/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160002

On Tue, Sep 15, 2026 at 09:35:21PM +0200, Fabio Forni via B4 Relay wrote:
> @@ -821,23 +825,23 @@ static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mu
>  }
>  
>  /**
> - * devm_mux_state_get_from_np() - Get the mux-state for a device, with resource
> + * devm_mux_state_get_from_swnode() - Get the mux-state for a device, with resource
>   *				  management.
>   * @dev: The device that needs a mux-control.
>   * @mux_name: The name identifying the mux-control.
> - * @np: the device nodes, use dev->of_node if it is NULL.
> + * @node: the device nodes, use dev's fwnode if it is NULL.
>   *
>   * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
>   *
>   * The mux-state will automatically be freed on release.
>   */
>  struct mux_state *
> -devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
> -			   struct device_node *np)
> +devm_mux_state_get_from_swnode(struct device *dev, const char *mux_name,
> +			       struct fwnode_handle *node)

Shouldn't it be get_from_fwnode (not swnode)?

Kind regards,
Alvin
