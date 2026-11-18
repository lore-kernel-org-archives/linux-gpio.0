Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795000721;
	b=DkX5/JrRVcdIFz8MMlN+LuzeIbCd34m777KHiWmupJLGmg0ymrrXfrM7GCL49QkRuWtT
	 Bs5/LGKZDBUHW498UgiYXBtvuqw0zt+dCN1f310sjnyOdaKjdJrLrLWoPYEb2SKfEWOXB
	 Fa3wLmcGydzSKwAK9AdqhBC91Geq3vLiRW+D+oCPzHFWQwXuiQSmf+nL03+PYY2kIoOdJ
	 iADK2MUhOCit5NZ4xnv9m9YWrP7m32gfbXdEI6nkQ4184rUzZi7lSPQsOOYcNnaczx3sT
	 kvXZqryBJpP7hlvhqQuJGt23I3aNST9in+gKTdtnPvH3pN67EfhBJYK+i5lKPTmm2xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000721;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yfpSZKrd1+JHh9lC48PJtgjBWYFwNvuGhDDvHuuKkZk=;
	b=opTvmCjYURxULPm+FZvoETP2zva8lQviMUt+uVHZNsDtJ+QMZYcBjNALvYiessRKZqlU
	 kRU9a6l+Yb8MR8e6qrPV2bIOsPUuR35V5gT1lA7Ba5A9rEjyxNYd3HMA+uu5jKdzZfJib
	 /RAyXQdIQhBClyh36CSh9//YbNtRCAAh0U0TfUFPBtYxjxbAM8+2vjpFbWIut4hUWMG/D
	 Q4T5QrExxEmi7dN5bZHk2dCpkBKpVNW+iU2gFJmtA3BjCZbhp3++P/ZVB5nzq57cGqOA3
	 WZmNC8x5WztEiWk5eMyA7sEHZIYau54HvTqMvKfLtsOG6eKng3uOxu4Vt/2xHHkAFcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4B9cCclU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.46
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3792606A31C;
	Wed, 18 Nov 2026 11:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3792606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4B9cCclU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aubZelkJoM/4gB9VjJIkJjJPD76eqU7hohSPfKrGEsS3NrC9MMfGC5OkT+cYs1k0bHFlBi7bq/PPjSzog+s9Srz3LD4V44BmGhVnM64O/v9X7toyyM814ozDoGeAg8BtkJeU07ibWD3MoNHy+6CFtB/s8Tot2+2i8uFhX8Q8cwlH0oOwa9a5W5WFSL00XY+T9i/X/qYrD5f3V7T1ePoq8tF2sZBSTDoLxfULIMizvQT+ZBiZ9IcKirNe7euf9Vnph5OlL3tNG+J3Y7HBO7VG7GgA1ErtoN73Fltts2I0dCLryuvHZpKYbRYzW5z7RvxmVJkDwOkmEctq+VBP/qeUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfpSZKrd1+JHh9lC48PJtgjBWYFwNvuGhDDvHuuKkZk=;
 b=omSHRda3fw13KIOpHVXQ84dJyGxHC6SV6uyIZDtMGZeHB0IZ1kEkTm2EQNYIb8c1/i9U5EgsbDsmK3LbjJf9LN40G4an/VlIJGXQW+cbyNuMkHPk6P03c9Jabm/noEz1tvccAELfyeAPx7VIjZ8DffYDrprsKmEKCiZ/PgVi/G+u1Qh7UcdTP/kMhNkEZ3Fw834cO/EyY9CptwDe8r8s7GanM5jqhcdIMD8KIcanoD9pLIct8Um/vjaj9jx9jZiHn8XpnbA28R5rcUM5mmgqVoUBisBVpRn7K376JD2SAIG39MzQ9uEms+1sQ23xwrDQtIFDgMqNVlQsHMoJd9OzaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfpSZKrd1+JHh9lC48PJtgjBWYFwNvuGhDDvHuuKkZk=;
 b=4B9cCclUFyX3NcC66XorbOqQglSPUOGl53q9BLJaAdJ5XAvJhEOy0hXQGv6EBYfWVm7Z3Yob1UqnBzEsuxgC35+0Ki3E0H2EqWcMkqGKVAXUteGTBbaybxIZGqcj05J1K7gs1JV1XrnlClY0wMMfmbfEPPe7n4go+ROjvGPJFls=
Received: from PH1PEPF00013313.namprd07.prod.outlook.com (2603:10b6:518:1::4)
 by CY5PR12MB6623.namprd12.prod.outlook.com (2603:10b6:930:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 11:18:35 +0000
Received: from PH4PEPF0000B60A.namprd21.prod.outlook.com
 (2a01:111:f403:c95d::9) by PH1PEPF00013313.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:18:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH4PEPF0000B60A.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Wed, 18 Nov 2026 11:18:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 05:18:33 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 05:18:32 -0600
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 05:18:30 -0600
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [PATCH v2] pinctrl: zynqmp: Ensure function names are NUL terminated
Date: Wed, 18 Nov 2026 16:48:16 +0530
Message-ID: <20261118111816.2483052-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60A:EE_|CY5PR12MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: c22d0f42-2ab7-4bea-3d85-08df4565afce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|6133799003|3023799007|11063799006|56012099006|10067099003|261026130827099003|261026121527099003|261022115727099003|261026135527099003|261026140227099003|261022105027099003|261022113327099003|261022075727099003|261028144727099003|261021130227099003|261021135927099003|261021123027099003|261021133027099003|261021121427099003|261009223327099003|261009221727099003|261102123227099003|261009221227099003|261009223027099003|261009220027099003;
X-Microsoft-Antispam-Message-Info:
	eGNVbEnVp/6tLhWysS3aNc3E0g0RpnR4TMhee6crsG2aNMDZXsby3zA7GDdsVGht2VTWnYXrBKtUyX8MZnvyFwe2C4jG4H9Udkm/gAf4GuQ2SWRJVIB670lGlQi8KFug3w6omA1kJ4eyQGZMrwomq124cA//rzyHcpqcF1mEKIUIO2VwuR9u7+bIZv0t6poaYHiB9YTt3/fQoZolezMm5jcyRXicc1PEz+wWgHeqwr+D6Mo7izj5sJlHw+7s3eyp8rZgu9xzin5ziAbWkExBUKnKXlOtGcMjO8N4yNQp+GyY1VkLQTwVh54fQx/q2sbrYeYm7iyGCV5GzdYOh/eVUg9Vb0T3+uku10FFWYyfQoUu3RUTK9XOZ5PFesfKSn8qTp2lVYV7TyAgn57dIqfE4d/oLPbMQYAYKFMb8N42g6OmMgjVj74WpFp16ukWGKCVuPmwqsVTyakN3p/GJ212wyFX6zHQ2PnBzEFyJ83WP2pdjMc3TNG3a1GBLKdpO1umv/RxLzEwGp3k/J5IfEMUIs2Q9iESJvuXh8CnZYTgOX87/IisWbWbV2646U2Q/6yBRXh7mo/koWaRYrpqeg9B1qgUjJCAROv8Gv+vmvyEjrFzEJkom2nyzF9joEXiRN1iNta0J06aOzaeKmiqZB83yLHB/jkTXOZ3O8c9MpOQdFjiTc6TvJXWKMaxIiMNBDtJk97Nzo+CuOkHGH9F9WOXcg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(3023799007)(11063799006)(56012099006)(10067099003)(261026130827099003)(261026121527099003)(261022115727099003)(261026135527099003)(261026140227099003)(261022105027099003)(261022113327099003)(261022075727099003)(261028144727099003)(261021130227099003)(261021135927099003)(261021123027099003)(261021133027099003)(261021121427099003)(261009223327099003)(261009221727099003)(261102123227099003)(261009221227099003)(261009223027099003)(261009220027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vJmTAfuwLcMtXg6I7RH1llsvhjefqp+pC8V/f6rGSfrc9TVnaA26t9PEg7Xfe/2SrAz3xLW5F9h5Per7shtcNO2VL+Ep/eLpgdAVjsYU5pYGjogxFscjb6sd6KDGEU1/6vOMMuNBH4NMgw3nDq1g7DDZ2Lq2Ct8ppVt8pGW9+IhrWX6T+yxp3ndsSlEeXBnfnzaCL0gDYvm+g6ox5Y6UMsMXvdIwq9ZZjA8plSO2c8DMvxG5J6A3W2JZ0QJGjhQHtYh8Ca8BogU8lzB8wDn9A0PQ/qmstwRDPgTRE2fm2Kt5W7s7uYq6VNDKg6fTozeAFO7T6wHfNdWJJ2cUdNeLic9uHO1JJgvP4ZMiqQT8dRRAxum9GY5nKLvlx9PM+6VyF/D4+M/im7dYpYrQDxBVZASGHzlPUa8urPsEdwHONPOrnfwplGhghcNkmaBTqg9U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:18:35.2213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22d0f42-2ab7-4bea-3d85-08df4565afce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6623

PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
16-byte field and does not guarantee NUL termination. A 16-character
name fills the entire field.
The driver copies this field into a 16-byte buffer and subsequently
uses it as a C string. For a non-NUL-terminated name, string operations
can read past the end of the buffer into the adjacent groups pointer.

Reserve an extra byte for the NUL terminator and explicitly terminate
the copied function name.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
changes in v2:
- Replace macro/constants with sizeof()(comment from David Laight)

 drivers/pinctrl/pinctrl-zynqmp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index aba129ead04c..a0b48193ad98 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -29,7 +29,6 @@
 
 #define ZYNQMP_PIN_PREFIX			"MIO"
 #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
-#define MAX_FUNC_NAME_LEN			16
 #define MAX_GROUP_PIN				50
 #define MAX_PIN_GROUPS				50
 #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
@@ -61,7 +60,7 @@
  * and function group names supporting that function.
  */
 struct zynqmp_pmux_function {
-	char name[MAX_FUNC_NAME_LEN];
+	char name[PINCTRL_GET_FUNC_NAME_RESP_LEN + 1];
 	const char * const *groups;
 	unsigned int ngroups;
 };
@@ -635,7 +634,7 @@ static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
 	return 0;
 }
 
-static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
+static void zynqmp_pinctrl_get_function_name(u32 fid, struct zynqmp_pmux_function *func)
 {
 	struct zynqmp_pm_query_data qdata = {0};
 	u32 payload[PAYLOAD_ARG_CNT];
@@ -649,7 +648,8 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
 	 * the return value for this specific qid.
 	 */
 	zynqmp_pm_query_data(qdata, payload);
-	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
+	memcpy(func->name, payload, sizeof(func->name) - 1);
+	func->name[sizeof(func->name) - 1] = '\0';
 }
 
 static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)
@@ -795,7 +795,7 @@ static int zynqmp_pinctrl_prepare_function_info(struct device *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < pctrl->nfuncs; i++) {
-		zynqmp_pinctrl_get_function_name(i, funcs[i].name);
+		zynqmp_pinctrl_get_function_name(i, &funcs[i]);
 
 		ret = zynqmp_pinctrl_get_func_num_groups(i, &funcs[i].ngroups);
 		if (ret)
-- 
2.25.1

