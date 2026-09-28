Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA7045FFD5;
	Mon, 28 Sep 2026 22:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635548; cv=fail; b=TaETIriL+kvYwFQzHkp9cfczNq2mD9fEXwRbCxXnneSvhbN2VouH1TQIydVxoQ9123LsKQBxTr0TVUyrpFhovQtttXJqtQ6q91UXNjKE3CteWmbr2A6OwDrMXKT13qhUDiOOeqoEyjbw+JLgfs8jfxFkbcEV8wRPCiuSqGBQZPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635548; c=relaxed/simple;
	bh=V2M5cB8hHkC/rjS2IbuxhdWORZWvAjQ91jSvUmSgaPw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NwC9zkzPL5DR7m5NTfe1wydZ/fRlV0OrJ0ZQlozeCvqgTKlNo1N7/fWRjhE6RNXw5TE7Fkiy+XUT/Jp69SucwZvp+vzFq2pyOCpdBum11RtOhsTKQqMmBTHPBWTHGbi9k7XUCkj3awxmlHFiPQFGjLjy2goEFMwilYY/P8jqGb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q1ou3fk1; arc=fail smtp.client-ip=40.93.195.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q1ou3fk1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvJsJ1famez4JrC1+zLc37sUylviHRMto+y9w2EETHtn7L6JK//RjSW/5jdh8Zu3J4E7VoDYsJZepLcgvj5V8urRKqXSW0LA9fSNiZ0xDlfQQEbAnqWkrS+CCSRizu6AU9T+UNbtxzpfdUw720XDr/6TuWmsB1uhaiSFu+jIXyHphCNGhe8LpTi3s+UEjP4rC+4QpIrmJV80YWxS1dWI60Xuc6SlZhhR7hmTl02T8rxFuncu2auuHdxokSAVHAQ2odR/soPgS+5bvxZ6VXxGgKSIHZsnKL1K1BFEokXonnrJWPKwlJZnBQMB/XH/caiebF+QuqgOODCyuKxZyrW0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2M5cB8hHkC/rjS2IbuxhdWORZWvAjQ91jSvUmSgaPw=;
 b=f/fA/Uobw2tGoyffTDGxDcRbWKD4C/kxuaWQ3suOB/H1Rl9EVjEH/5c5KijzDssiiWCR+1n8DKuPddUlqwaL9dBVXa6VaRXi/zQb+xpBHqxq6+cXSk5+qfTsUCpHFdcALDtuPP/VjJrou+GfzY3t16OogOaXFF9NEbzME+PTZ0SsiKJ1izJoyc/vblR2xMoixmUJHi+zjuvSATbp2NjOPwpOSCvwwMNrWwdvDS9CdZ58p/Xv7D4RDnwz0cA2qMRuVBZldxoEC2MnDs0IjAVJ8Cerux2CqOmfcyzdiCTEpwXMsYn42Jts9cPoZ2RKg26zTMvdwtlpsYr4nPw4Wfy4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2M5cB8hHkC/rjS2IbuxhdWORZWvAjQ91jSvUmSgaPw=;
 b=q1ou3fk1BWC60szT86Dun/dv6VJt6EHWUoKUJCkK4G3+ZIXQrW8s1EXuPn2DgXSul5BTQmJRom0r7cAPlZ65gCefxPdgjkB2bxner2eZkaFEF31/W3Gdqqk1XfklQQTvzfs9PLO9q4LQG0aL/kJcofo6hOes348+L6m7lQexqsI=
Received: from DM4PR12MB6543.namprd12.prod.outlook.com (2603:10b6:8:8c::6) by
 BL1PR12MB5852.namprd12.prod.outlook.com (2603:10b6:208:397::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:45:40 +0000
Received: from DM4PR12MB6543.namprd12.prod.outlook.com
 ([fe80::5f95:bdd2:c838:19a4]) by DM4PR12MB6543.namprd12.prod.outlook.com
 ([fe80::5f95:bdd2:c838:19a4%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 22:45:40 +0000
From: "Dayananda, Vivekananda" <vivekananda.dayananda@amd.com>
To: "dumitru.ceclan@analog.com" <dumitru.ceclan@analog.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Julien Massot
	<julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	"mitrutzceclan@gmail.com" <mitrutzceclan@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>,
	"martin.hecht@avnet.eu" <martin.hecht@avnet.eu>, Andrian Suciu
	<Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>, "Kohn,
 Chris" <chris.kohn@amd.com>
Subject: RE: [PATCH v17 17/22] media: i2c: maxim-serdes: add MAX96717 driver
Thread-Topic: [PATCH v17 17/22] media: i2c: maxim-serdes: add MAX96717 driver
Thread-Index: AQHdT5sW6FHxrh5dmUu5vbB34BJfkg==
Date: Mon, 28 Sep 2026 22:45:39 +0000
Message-ID:
 <DM4PR12MB654357F3383CBF700D914CBAE88D2@DM4PR12MB6543.namprd12.prod.outlook.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
 <20260909-gmsl2-3_serdes-v17-17-002499e534e8@analog.com>
In-Reply-To: <20260909-gmsl2-3_serdes-v17-17-002499e534e8@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_ActionId=a911fb59-48ca-4766-bb01-e583d25d604a;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_ContentBits=0;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Enabled=true;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Method=Privileged;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Name=Non-Business
 v26;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_SetDate=2026-09-28T22:42:14Z;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Tag=10,
 0, 1, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6543:EE_|BL1PR12MB5852:EE_
x-ms-office365-filtering-correlation-id: 5f221b42-2dcb-4f68-3c58-08df1db2388b
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|7416014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 URePm2Vk6lvrUl/Lgbl1oeh28xjWAUsIti5Pe2W8uwc68j2HddMpXMIZLEAzOEzlZr8yWAmHVXNqs5xig/nkoIRopP6NwIZbaWsRy03Yu849RCorvCGD4lq19MgP64ZiDmDj6Ak+LhMsV+wLq6krmRuHRxUNFmmqgxnMkP/4qd7Y3twp36m9l8fpV62928jrNe5WBTQWM++sn7azmthLmXwOrAHD8wSHup5hcZRhS1MagcgXPmIJzsVyyM0/FwgWEbE8xJSaMkbXBxqNdkzNbQUaAZ41AUJWhiUGBryrxYVBklB5OO8PMJ1ptMPR5M/ZWpzMtB98FMRG48g/IAmsNaVNlDj+pa5JP89rchn5ewkPrLvRnJp/qX0fABUio8SUI6YgfsYy9l0PzAqjd0M9nWSmdV6B5On12zA82Dea2dOtEg1q7JuMlJy+7Y2z3n+btbn7WcnZNOuZ6aful6unsHrrGvBuHmU9pvFwC2yREoYf0gG8xc7f/gIVKj7pLGS3ECbTDfP8y3nm7LkH1Hw7bjx9ghdyVzVquoWjhpgKjgNbLjlXdJR6UjRGfAvDAdd7jrYJV2uJkDSTCazLyOu9j7mdz5+4e56HCkpNLj8t3MHqqU4Qvm1frLedAx3Pl3OOW8/bu525IPsdrHhU1nE+27AibXtai+TeBQITiLM+kO0TggEjhZ5IVU+MDhnHZBDl4zDtlwa/OsJtTYaLBoWXTc51rRj1glLyejsbaMsdnOI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6543.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(7416014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEgzQlZaaVljT1V0NmlvTEdDRjFNdmhNVDZVdkxGeDIxUHRFQkFrcndTZXZN?=
 =?utf-8?B?b201eTRXeWtkY2pUdUJNUElHNW8wNjd5bFlkMzJ5REhTVnNpWnZxMlFFRUV1?=
 =?utf-8?B?eURlQzZ6U1FqaWRsZldxZ0hlQU5vY3pSZmU4NGxlQjl1TlpVVDUxVUlsOEVx?=
 =?utf-8?B?VzljNGs0VFlpUEpTbVQxM28yK0VQTHRNYWtyeFF6MmU1ZWloeEV4MlNBM2hY?=
 =?utf-8?B?cnFGaTRvZUxPbnI3WW4xTW5SdGlsTFFuQzV6NVVEUE9qTW9obGFLVjdrSldD?=
 =?utf-8?B?dzVHS0dsL0FzSU42eHR5b21ua1hjcGFjcVJBTmJiYm5nc09NRnZRNDlKZldI?=
 =?utf-8?B?NkRaWENMUTFCOFlHYVNvb0dpS2hPU3dQYzBZd1hpWWhpbSsyMnpFRTFQK0lD?=
 =?utf-8?B?b1BHbXFSUUJ1TE1WNzN0bFpvVW41TDZXWnlHSmJBelVxSUpDMk4xcmVYeEdL?=
 =?utf-8?B?Y0NOTjQ2QkNXNytOdWZZeDI5M3JEUnM0WExLZkY5MVNWREZSN0JuZlhVUkhO?=
 =?utf-8?B?RFpyRTByeUUzZXIzWDg0Ykc5WWdPYWljRVBmUDFkbzNwQnVrQVFmc25oRlNu?=
 =?utf-8?B?WUpaOFpzdnZCZFRxTzdsT2dVOUpUaW9TRzJYVmVobk1nb3hiSXhKOFREdjhH?=
 =?utf-8?B?R0xnbUJmc1RPbU9aZ0VHZzRrQ3MxYkdYcEJudVRiQW1RWWcxMEFsUWVnRkpi?=
 =?utf-8?B?ci9IODk2WkxUR0lCM1RYbGF0Sm1QVGJmcnA4OFRnOWpHQXJhdTQ4Zlc1a013?=
 =?utf-8?B?bDZUU3NaY2NvQ2hEYnk0Sjd6K3V4Sjd4Y1Bob1IzdzMzTXBORzNHcWJObVV5?=
 =?utf-8?B?M1Y2RjNKSGFCekN6cnV6WlVJYkozMmpKSXQvSDE2RGMreStBeEJ0bitra1M5?=
 =?utf-8?B?ckw5WGEwK1QxODZzSzJIUk1FSjBzL0plRms2anhxZGthL2c5V3BtdU9LL3VV?=
 =?utf-8?B?cFVNRTkzckRzWFExcld0WW9IVWprZENwOGNNUHl4cHhydXVaampEQ1BMV094?=
 =?utf-8?B?dlRadVduODJiWnVzcHhMMitGY01sTU51QWFXbHlmbE1aLytxcndOQ0NWZFRy?=
 =?utf-8?B?dEZsb0s1a3E0cnoyUGVka3FLZnkxVTFaZXB4eWN1SVFjOWdFU3MySnRDM2RB?=
 =?utf-8?B?MEkwL3ZtRHkzdFI1a0NXWEJ3VzdMWXF5R210QzZDYlowQWI4a3RBeUJWZlh0?=
 =?utf-8?B?RHM0cHZnNjhBWkttallCaXVDZm5OdlUweUdjazBwYnF5SVpUQXNnTnJPeGUy?=
 =?utf-8?B?ZHVjRDNrbXE3MXB3UEZLZHJKQW9CQXlhOTFMaWpBVmhWcmZia05vSHI5Q2tO?=
 =?utf-8?B?L05GczA5NWxmVjB0Smp0Y1YyK0llNzJpWEpDVXVKOEZ0bnF0ZWJaRDJtY25S?=
 =?utf-8?B?ZFpBdUh4cUNCZHZIWFBlRWQ1QmxDZmwweDY5Z3A5eUFvUHlMNzVOTGJ3SjhQ?=
 =?utf-8?B?YVl3WkRzYldiVmtZelZEK3RZL01HdnZFZGtWWjR0b202U1M0ZGQ0dlY4SVN2?=
 =?utf-8?B?Q1NLS0ROZVJ1ZGZ0WFhSMHYvZy81Tkhwem1WbFFPNk1OaE9Lc0x0RzRVcnJT?=
 =?utf-8?B?YVVNekptUWN3OU5RM1R4Z2Q3TmpRZGtoek9wRm9YRzVtNHA1S2RPNlJrRnZZ?=
 =?utf-8?B?VFl2Y3VEWXZVL2FzQUtlakdWcGt1UmJjQzhUMk9hV2llNzRiaXRVTVhWRHVu?=
 =?utf-8?B?ODdiM2U1d1RGRHY0RUNYTC8zVW1aOTFhUHEvMlFBUU81OE5yd20zR21yQktC?=
 =?utf-8?B?bTNWSmZxZ2s2eDVqak1Wc1RmMjhieWJvUTVNbzN5d2RueUZEazJBUmdrWUFv?=
 =?utf-8?B?ck1GL2NqMDBiRG1xdVV4TXh3QUcva1gxdWZORE5Zd0dJN3lxUG0xSTBpeGpu?=
 =?utf-8?B?TTRqVWtCL1lUdy9McWNjTXIrVHJVNUtZRDE0OENVT2J5Z2hNdUEyS2hiNmg1?=
 =?utf-8?B?d0xpTkZxcmpNbEQxVlhqRmQvdmcxT2NscjVIdzZ3bkJ4MW12MmlWMkp6bFpL?=
 =?utf-8?B?NDcvbUJTNkdBUmJIR3RubkhRY2pRV1FtRXBVR3h4WkJDS0NOcm1vamp2MjJT?=
 =?utf-8?B?YXowcFNiYkdaUGNyblhyQi9NbU90WTR4Qk1uN0VlaVZBUFdacjI2cG5BbWFI?=
 =?utf-8?B?Z0JqTEc1VUo0TG4yVUJzaDdzV0wvNlMyR3FLY2FpQUh6SW05U0F5WXdiUlda?=
 =?utf-8?B?ZVQ5NmdxbE56Zm43MGFGblZCb2d4SS93Skk2ZnNvRW5NNTFQSUhaVzh1MG4y?=
 =?utf-8?B?eXoxWlMreTQxcmlNek1uV2V1QkQ4NlJsaGlxVVRxaUQzZkhZNXZnVTYrYWhi?=
 =?utf-8?Q?/19BGHsGl1pOnNokln?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6543.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f221b42-2dcb-4f68-3c58-08df1db2388b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 22:45:39.9391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jbZgVo/QXo7GmcdCoqgqtbv9kVFOd3GdMH5HpQoD7VnnOI+teXld8QbsMKgJJo2/cyU+DL/sehYTjJO2xMFtBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5852

ICBIaSBEdW1pdHJ1LA0KDQogIEkgZm91bmQgYW4gaXNzdWUgd2l0aCBzZXJpYWxpemVyIHRlYXJk
b3duIGR1cmluZyBEZXZpY2UgVHJlZSBvdmVybGF5IHJlbW92YWwgd2hpbGUgdGVzdGluZyBhIGRv
d25zdHJlYW0gc2V0dXAgYmFzZWQgb24NCiAgdGhpcyBzZXJpZXMuDQoNCiAgTXkgc2V0dXAgaXMg
YSBLVjI2MCB3aXRoIGEgTUFYOTY3MjQgZGVzZXJpYWxpemVyIGNvbm5lY3RlZCB0byBhIEhhd2sg
c3RlcmVvIGNhbWVyYS4gVGhlIGNhbWVyYSBoYXMgdHdvIEFSMDIzNCBzZW5zb3JzDQogIGJlaGlu
ZCBvbmUgTUFYOTI5NUQgc2VyaWFsaXplci4gVGhlIHNlbnNvcnMgYW5kIHR3byBFRVBST01zIGFy
ZSBkZXNjcmliZWQgdW5kZXIgdGhlIHNlcmlhbGl6ZXLigJlzIGkyYy1nYXRlIG5vZGUsIHVzaW5n
DQogIGRpc3RpbmN0IGFkZHJlc3NlczogMHgxMCwgMHgxOCwgMHgzMCBhbmQgMHg1NS4gVGhlIGRl
c2VyaWFsaXplciB1c2VzIEkyQyBBVFIgZm9yIHRoZSBzZXJpYWxpemVyIGl0c2VsZi4NCg0KICBP
dXIgYXBwbGljYXRpb24gZmxvdyB1c2VzIHhtdXRpbC9kZngtbWdyZCB0byBsb2FkIGFuZCB1bmxv
YWQgdGhlIGNhbWVyYSBEZXZpY2UgVHJlZSBvdmVybGF5LiBXaXRoIHRoZSBTZXJEZXMgZHJpdmVy
cw0KICBidWlsdCBhcyBtb2R1bGVzLCByZW1vdmluZyB0aGUgb3ZlcmxheSBjYXVzZWQgYSBOVUxM
IHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gaTJjX2F0cl9kZWxfYWRhcHRlcigpLiBUaGUgcmVsZXZh
bnQgcGFydA0KICBvZiB0aGUgdHJhY2UgaXM6DQoNCiAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwg
TlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAw
MGEwDQogIENvbW06IGRmeC1tZ3JkDQoNCiAgQ2FsbCB0cmFjZToNCiAgIGkyY19hdHJfZGVsX2Fk
YXB0ZXIrMHgzYy8weDE1YyBbaTJjX2F0cl0NCiAgIG1heF9zZXJfaTJjX2FkYXB0ZXJfZGVpbml0
KzB4NjgvMHg5MCBbbWF4X3NlcmRlc10NCiAgIG1heF9zZXJfcmVtb3ZlKzB4NDQvMHhkMCBbbWF4
X3NlcmRlc10NCiAgIG1heDk2NzE3X3JlbW92ZSsweDE0LzB4MjAgW21heDk2NzE3XQ0KICAgLi4u
DQogICBpMmNfdW5yZWdpc3Rlcl9kZXZpY2UrMHhjNC8weDEyOA0KICAgb2ZfaTJjX25vdGlmeSsw
eDZjLzB4MTQ4DQogICAuLi4NCiAgIF9fb2ZfY2hhbmdlc2V0X3JldmVydF9ub3RpZnkrMHg0OC8w
eGQwDQogICBvZl9vdmVybGF5X3JlbW92ZSsweDEyNC8weDFhMA0KICAgLi4uDQogICBjb25maWdm
c19ybWRpcisweDI3OC8weDQyMA0KDQogIEF0IHByb2JlIHRpbWUsIG1heF9zZXJfaTJjX2FkYXB0
ZXJfaW5pdCgpIGZpbmRzIGkyYy1nYXRlIGFuZCBpbml0aWFsaXplcyBwcml2LT5tdXgsIGxlYXZp
bmcgcHJpdi0+YXRyIE5VTEwuIEhvd2V2ZXIsDQogIG1heF9zZXJfaTJjX2FkYXB0ZXJfZGVpbml0
KCkgbG9va3MgdXAgdGhlIGZpcm13YXJlIGNoaWxkIGFnYWluIHRvIGRlY2lkZSB3aGljaCByZXNv
dXJjZSB0byByZWxlYXNlLg0KDQogIER1cmluZyBvdmVybGF5IHJlbW92YWwsIHRoZSBjaGlsZCBu
b2RlIGhhcyBhbHJlYWR5IGJlZW4gZGV0YWNoZWQgYmVmb3JlIHRoZSByZW1vdmFsIG5vdGlmaWVy
IHJlYWNoZXMgdGhlIHNlcmlhbGl6ZXINCiAgZHJpdmVyLiBUaGUgbG9va3VwIHRoZXJlZm9yZSBy
ZXR1cm5zIE5VTEwsIGNhdXNpbmcgdGVhcmRvd24gdG8gc2VsZWN0IHRoZSBBVFIgcGF0aCBhbmQg
Y2FsbCBpMmNfYXRyX2RlbF9hZGFwdGVyKE5VTEwsDQogIDApLg0KDQogIFRoZSBhZmZlY3RlZCBp
bml0aWFsaXphdGlvbiBhbmQgdGVhcmRvd24gZnVuY3Rpb25zIGluIG91ciBkb3duc3RyZWFtIHRy
ZWUgbWF0Y2ggdGhvc2UgaW4gdGhpcyB2MTcgcGF0Y2guDQoNCiAgTXkgbG9jYWwgZml4IHNlbGVj
dHMgdGhlIGNsZWFudXAgcGF0aCB1c2luZyB0aGUgc2F2ZWQgcmVzb3VyY2UgcG9pbnRlcnMuIEl0
IGFsc28gYWRkcyBOVUxMIGNoZWNrcyB0byB0aGUgY2xlYW51cA0KICBoZWxwZXJzIGFuZCBjbGVh
cnMgdGhlIG11eCBwb2ludGVyIGFmdGVyIHJlbW92aW5nIGl0cyBhZGFwdGVycy4gVGhpcyBsZXRz
IHRlYXJkb3duIGZvbGxvdyB0aGUgcmVzb3VyY2UgYWxsb2NhdGVkDQogIGR1cmluZyBwcm9iZSBl
dmVuIGFmdGVyIHRoZSBmaXJtd2FyZSBoaWVyYXJjaHkgaGFzIGJlZW4gZGlzbWFudGxlZC4NCg0K
ICBDb3VsZCB5b3UgcGxlYXNlIGZvbGQgdGhlIGZvbGxvd2luZyBmaXggaW50byB0aGUgbmV4dCBy
ZXZpc2lvbiBvZiB0aGUgc2VyaWVzPw0KDQogIFNpZ25lZC1vZmYtYnk6IFZpdmVrYW5hbmRhIERh
eWFuYW5kYSB2aXZla2FuYUBhbWQuY29tICh2aXZla2FuYUBhbWQuY29tKQ0KDQogIGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL2kyYy9tYXhpbS1zZXJkZXMvbWF4X3Nlci5jIGIvZHJpdmVycy9t
ZWRpYS9pMmMvbWF4aW0tc2VyZGVzL21heF9zZXIuYw0KICBpbmRleCBlZTg5MWY2YWE2MTIuLjFm
YWM0NzY4NTkyMSAxMDA2NDQNCiAgLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvbWF4aW0tc2VyZGVz
L21heF9zZXIuYw0KICArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9tYXhpbS1zZXJkZXMvbWF4X3Nl
ci5jDQogIEBAIC00MzksMTAgKzQzOSwxOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19hdHJf
b3BzIG1heF9zZXJfaTJjX2F0cl9vcHMgPSB7DQoNCiAgIHN0YXRpYyB2b2lkIG1heF9zZXJfaTJj
X2F0cl9kZWluaXQoc3RydWN0IG1heF9zZXJfcHJpdiAqcHJpdikNCiAgIHsNCiAgLSAgICAgLyog
RGVsZXRpbmcgYWRhcHRlcnMgdGhhdCBoYXZlbid0IGJlZW4gYWRkZWQgZG9lcyBubyBoYXJtLiAq
Lw0KICArICAgICAvKiBUaGUgaTJjLWdhdGUvbXV4IHBhdGggbmV2ZXIgYWxsb2NhdGVzIGFuIGFk
ZHJlc3MgdHJhbnNsYXRvci4gKi8NCiAgKyAgICAgaWYgKCFwcml2LT5hdHIpDQogICsgICAgICAg
ICAgICAgcmV0dXJuOw0KICArDQogICsgICAgIC8qDQogICsgICAgICAqIFJlbW92ZSBkb3duc3Ry
ZWFtIGFkYXB0ZXJzIGJlZm9yZSB0aGVpciBwYXJlbnQgdHJhbnNsYXRvci4gVGhlIEFUUg0KICAr
ICAgICAgKiBBUEkgYWxzbyBhY2NlcHRzIGEgY2hhbm5lbCB3aG9zZSBhZGFwdGVyIHdhcyBuZXZl
ciBhZGRlZCwgd2hpY2ggaXMNCiAgKyAgICAgICogbmVlZGVkIHdoZW4gdW53aW5kaW5nIGEgZmFp
bGVkIGFkYXB0ZXIgaW5pdGlhbGl6YXRpb24uDQogICsgICAgICAqLw0KICAgICAgICBpMmNfYXRy
X2RlbF9hZGFwdGVyKHByaXYtPmF0ciwgMCk7DQoNCiAgICAgICAgaTJjX2F0cl9kZWxldGUocHJp
di0+YXRyKTsNCiAgKyAgICAgLyogUmVjb3JkIHRoYXQgbm8gdHJhbnNsYXRvciByZW1haW5zIGZv
ciBhIGxhdGVyIGNsZWFudXAgY2FsbC4gKi8NCiAgICAgICAgcHJpdi0+YXRyID0gTlVMTDsNCiAg
IH0NCg0KICBAQCAtNDc4LDcgKzQ4NywxMyBAQCBzdGF0aWMgaW50IG1heF9zZXJfaTJjX211eF9z
ZWxlY3Qoc3RydWN0IGkyY19tdXhfY29yZSAqbXV4LCB1MzIgY2hhbikNCg0KICAgc3RhdGljIHZv
aWQgbWF4X3Nlcl9pMmNfbXV4X2RlaW5pdChzdHJ1Y3QgbWF4X3Nlcl9wcml2ICpwcml2KQ0KICAg
ew0KICArICAgICAvKiBUaGUgQVRSIHBhdGggYW5kIGEgZmFpbGVkIG11eCBhbGxvY2F0aW9uIGxl
YXZlIHRoaXMgcG9pbnRlciBOVUxMLiAqLw0KICArICAgICBpZiAoIXByaXYtPm11eCkNCiAgKyAg
ICAgICAgICAgICByZXR1cm47DQogICsNCiAgICAgICAgaTJjX211eF9kZWxfYWRhcHRlcnMocHJp
di0+bXV4KTsNCiAgKyAgICAgLyogRG8gbm90IHVzZSBhIHN0YWxlIG11eCBwb2ludGVyIHRvIHNl
bGVjdCB0ZWFyZG93biBhIHNlY29uZCB0aW1lLiAqLw0KICArICAgICBwcml2LT5tdXggPSBOVUxM
Ow0KICAgfQ0KDQogICBzdGF0aWMgaW50IG1heF9zZXJfaTJjX211eF9pbml0KHN0cnVjdCBtYXhf
c2VyX3ByaXYgKnByaXYpDQogIEBAIC01MDcsMTYgKzUyMiwyMSBAQCBzdGF0aWMgaW50IG1heF9z
ZXJfaTJjX2FkYXB0ZXJfaW5pdChzdHJ1Y3QgbWF4X3Nlcl9wcml2ICpwcml2KQ0KDQogICBzdGF0
aWMgdm9pZCBtYXhfc2VyX2kyY19hZGFwdGVyX2RlaW5pdChzdHJ1Y3QgbWF4X3Nlcl9wcml2ICpw
cml2KQ0KICAgew0KICAtICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlOw0KICAtDQog
IC0gICAgIGZ3bm9kZSA9IGRldmljZV9nZXRfbmFtZWRfY2hpbGRfbm9kZShwcml2LT5kZXYsICJp
MmMtZ2F0ZSIpOw0KICAtICAgICBpZiAoZndub2RlKSB7DQogIC0gICAgICAgICAgICAgZndub2Rl
X2hhbmRsZV9wdXQoZndub2RlKTsNCiAgKyAgICAgLyoNCiAgKyAgICAgICogUHJvYmUgc2VsZWN0
cyBlaXRoZXIgYW4gaTJjLWdhdGUgbXV4IG9yIGFuIEkyQyBhZGRyZXNzIHRyYW5zbGF0b3INCiAg
KyAgICAgICogKEFUUikuIFRlYXJkb3duIG11c3QgZm9sbG93IHRoYXQgcmVzb3VyY2UgY2hvaWNl
LCBub3QgcmUtZGVyaXZlIGl0DQogICsgICAgICAqIGZyb20gZmlybXdhcmU6IHRoZSBpMmMtZ2F0
ZSBjaGlsZCBtYXkgYWxyZWFkeSBoYXZlIGRpc2FwcGVhcmVkIGR1cmluZw0KICArICAgICAgKiBE
VCBvdmVybGF5IHJlbW92YWwuIFRyZWF0aW5nIGl0cyBhYnNlbmNlIGFzIGFuIEFUUiBjb25maWd1
cmF0aW9uDQogICsgICAgICAqIHdvdWxkIHBhc3MgYSBOVUxMIHRyYW5zbGF0b3IgdG8gdGhlIEFU
UiBjbGVhbnVwIEFQSSBvbiBhIG11eCBkZXZpY2UuDQogICsgICAgICAqDQogICsgICAgICAqIE9u
bHkgb25lIGFkYXB0ZXIgdHlwZSBpcyBpbml0aWFsaXplZC4gSXRzIHNhdmVkIHBvaW50ZXIgc2Vs
ZWN0cyB0aGUNCiAgKyAgICAgICogY2xlYW51cCBwYXRoIGV2ZW4gd2hpbGUgdGhlIGZpcm13YXJl
IGdyYXBoIGlzIGJlaW5nIGRpc21hbnRsZWQuIFRoZQ0KICArICAgICAgKiBkZWluaXQgaGVscGVy
cyBhbHNvIHRvbGVyYXRlIE5VTEwgYWZ0ZXIgY2xlYW51cCBvciBza2lwcGVkIHNldHVwLg0KICAr
ICAgICAgKi8NCiAgKyAgICAgaWYgKHByaXYtPm11eCkNCiAgICAgICAgICAgICAgICBtYXhfc2Vy
X2kyY19tdXhfZGVpbml0KHByaXYpOw0KICAtICAgICAgICAgICAgIHJldHVybjsNCiAgLSAgICAg
fQ0KICAtDQogIC0gICAgIG1heF9zZXJfaTJjX2F0cl9kZWluaXQocHJpdik7DQogICsgICAgIGVs
c2UNCiAgKyAgICAgICAgICAgICBtYXhfc2VyX2kyY19hdHJfZGVpbml0KHByaXYpOw0KICAgfQ0K
DQogICBzdGF0aWMgaW50IG1heF9zZXJfc2V0X3RwZ19mbXQoc3RydWN0IHY0bDJfc3ViZGV2ICpz
ZCwNCg0KICBUaGFua3MsDQogIFZpdmVrYW5hbmRhDQoNCg==
