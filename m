Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23476440A19;
	Mon, 27 Jul 2026 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174173; cv=fail; b=IijxdM/amF75SNvrPdcPj4Mq5NJC5O+QHF5kDAvEz9FbURYCJDZNulKtvCG7dSwSH7jSEswV+3vbwoXO6I9nuAoNHyNXgINmoeGXmeNlXEsFBnP9kXy5KSThwxedNphcHJ6PrhTcHKY3a/RKi8OVApMZ+JDGHzsMBlV6GZNYNBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174173; c=relaxed/simple;
	bh=sJ4FiaA4bUjeLyTo38CH+UQHvN56tWmQfEb+I1Q6jls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AGHZAhY73qMkDVpEmaKIk7tZP8/jTj1J+ljTqLb5vHZigb81fxPEwei1xDSrR87pNLQriUGexnWfpaeOU8B1GCf0TRw5Ad+zSIj5hKxx716oTt63PIYazm3a3PJ2vyZp8K+OZg1OLQlbMBn8gDTqA85gheDqb6iSis599eJhRNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=DuaIryns; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="DuaIryns"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOWC6UfzKmOCxCEi9fGT6YWK5TMk6idLE9HbdINA8f5ESHrEIMeKZSByR61SK16lSRD+7R5KjeJfdKbyjWHg83JMMM46kEQM/8ltap0iThgEDKjyld7US1AyOlrluWhQ2Y2pXw8mFRG7wRhDU+KTFv+qAov8Xd1lzINwlKvDYdBewHq0bSgMZcUlVLMcnHroX6/RNVpta935ejOpr52yfszra4yCbeRcsMe1ztHm7D78gK78t244+zi2xt2+y3GF6JjoIvshVJQDUjSN/S9bO83PLkkGgzpqdlbD1COiijFvrSBdWPZa8EtEObDZO0q9XtDI+riyz/wrG6Me4DetGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNczyRCyq+MCvm6MUR+0isFyFNBcuMqhQM9I97MKDgk=;
 b=YgVVuhBnqDtq2i7uMFn3XmfYxg4+0GW0bYmZwGlRenxcN/txiDddkCPHqFVb3OYMd3FYxzcxsj68D/ZD7E4tHihFnGwvv8m2FiyDWWzuG/sixt1T7e3+Ta2unie8fK2jtf7MANJPtZozKT0Bt38BcIec9JejcujWoGLfz9f/GUC8b4neWxu6D8f9DHmQAl03CVkYUHj3N2fuommbivVEq2D3eKaobGEDI/EwrCrXjNFzrjJsM7OGPzExS0/MZGt9t651uC268klUljYupJ2XZaAhRTGpeWwZwduguHql5KWwVfLh4uJTeDfrw4h9JrXGL/xjcr1UG2Sy7GKtB1K/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNczyRCyq+MCvm6MUR+0isFyFNBcuMqhQM9I97MKDgk=;
 b=DuaIrynsCZOaohTI5rAB6sDzUdgQeiUlbvSUzZNB36Y2SdNaUSEReslhK5RExASJRPHk/MBtDS/aEAbeYlwLOV5TUnPCh4EEdxKlyVHxpet8gRwLX/5Q39Nh7xj0MWE/QQJEvLcRdapKx+mhAV4GTE1cTm6DFOyjrQUGn39PAucLyHErMy0RI+k7V42JCD+zt1dFfJkGhn6i0+UbXUCG5iTy+7YsmsgH+Rvr3f+az+qZvS41xyheYrxbsOaAnsNoRGw3u/zVx+T2nCD5JNMTdKhIn5+G3ucriyniKm60s9fy9+nUKmBu+l5divilCZCYvCkXXl2lAwUKzl6vTDBC0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:37 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:37 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v8 26/35] dt-bindings: pinctrl: airoha: an7583: add npu_uart pin group
Date: Mon, 27 Jul 2026 20:41:32 +0300
Message-ID: <20260727174141.664933-27-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed0c60a-b5e0-4a3d-87dd-08deec067285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	oHNZPARldmxbf5sW2SwyyZAtEUCrHLhiuACnlldVcvwYHLtzcu/WV0YmxQvM88dIcrT2fWPaQ+wy5RbXdQ39eRiPMUqKfXMmhcv0Mvs4PnK7Co4q5Wfno2fiLq26ULQPa9iQpOPDeqdbS5S6H0btmOYyQW+pJnxSAfAOoGiXAhC3PGxl6vaccGlmZWF2NmVoZZHmOG/NQBPu6hUB1QsxQiUx0KA4xizEgxrGrCYWreAHlrvCNZv1tPVmTzcVTPLv60OI7qtJppgF6gQUXq7bN8OheSOJXFOI/M8+R7Ww/lAbDUfTnhh4q77TyJCGWEfR/EeLISU8KpuoBRsm0b9QaS2pwld/gVUjc+11C3SxkCnCw4PHyEQ52M7w71tJqepKWlQ57qT6NmFpifeczoxmxjVdHm1KSzjxpPb285e8X+0C0WzAj8fwle2lf+CIfuGJorvdUNqEsPGMShCfeNsTIxLk0nidqo6/rmpoM16t2S2dodp7hAjiCK0udIcHIBuVtG2Th6+j6PuAn5fMrMF84JeC8GscPPQxnCMWUFL4EANtqbqpZBYn3CzckYIsMrWNEm8gU7zNC/A1IkehOu4o1+o9Ea/qWx76qdn4rinKyvevdG0e0850UVWJHF328l6HaSL51zeimAYtdOYHxBhy4lpTZJTgfW9p4KurgxCNLrbVs4CcubVf8b/x3d52wJUiWHikDDaQi1bQwHdNn/+qX1AFcYKq9TaQic0odj2/4+jB87n5hj/toPqCUX1jSgaP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7rPt/anye9BklpmXatF9zKpsS2IA0VrjTG7BtoHh6EW1K/RmoVIm0fx/Q4FW?=
 =?us-ascii?Q?rdP0V54cKcCd9NmELGUF99q8XewJE5BDpslGOO4qrK9jxWaVHmjMJ/MuswUJ?=
 =?us-ascii?Q?j9kNu2DTVbJ9KU2iU6kUXW+/Xc8K7Eg/vVbaueQfIhQAcIW0R96wxY2FU9kZ?=
 =?us-ascii?Q?ROVrs2SA1zUb/AjFD1IOuKwfdOAWmo/tyTZRkGIzH8LdFlu38VfMNlCE8RfK?=
 =?us-ascii?Q?BF7En6LbmlYoNimtv+FzDXHlUR4TUnJlLUWqjKxfP74cosBsV/UEEFfboZEG?=
 =?us-ascii?Q?AtrVHYPSYVR0bi3WMgW6TqULrf+GjubnIMBO8kMqxxaMgM5AVHLB4lrI60N0?=
 =?us-ascii?Q?eZmBOQ8Jz0hIyNCr2/Iv973gdzIJq7Yc9ZVJWrfSgYqU6TeFMQO8pPIGOuB/?=
 =?us-ascii?Q?LdLhzbYGL4dpmjDHZExgd/A5yS+GFbcY2b6fw7kAvBLLlnmBO+ADghXcehhA?=
 =?us-ascii?Q?PyzbZjO9frLIVUVJ0F3RZcmetd2pht6LvIi6/9etWJF/xikgDDdELwXbpfhG?=
 =?us-ascii?Q?vim8+K/wjl85KQA0aTEHXF0T0xK87U8lpzyYJ56Fzupx69k444lytVIvjaRA?=
 =?us-ascii?Q?pBfVLrpzgPx6TpZLgI6KbihRfyhpkdRmXzJTQH3IbDzFjl+PmGHBLYf4btfd?=
 =?us-ascii?Q?ORJvVpTB6TkeVLAsXQi6XR1UwdvoxSK5Nfc0kuYXaYbGbcwk2d67rKvlABMJ?=
 =?us-ascii?Q?SmTtBMivZkAoycYPMfaX/ViGx8yJQXirrt+jrzPdp/idwaAhwnm7gc7GgWdH?=
 =?us-ascii?Q?GJ9ewEtjSDa+7tSrZ52PRGF/Ttf6ug7imTJ7Ps/8AObupKKp0KB1/BX6tF33?=
 =?us-ascii?Q?wFnl3h0trLfVZLk+sybRbcnt7lXPi6CtsyhDv4+i32fHfeiWDS1/l/dhDsZF?=
 =?us-ascii?Q?5evWF9uYcTedmNaOKgi08LSotv0Qx+N+ylZIWywf0zCohNfcTbJHXEgzjOHq?=
 =?us-ascii?Q?h1kRXnvLA3VE03VS+DfPwzneSTdrjKjOQQgYPBdYaVjeL2+9+o/fN86+8IfA?=
 =?us-ascii?Q?ZcVck/DXL7rchOWOC84BKnYfGJZf//e3gjrFeongCf++s33n7XFaxxaT+uzb?=
 =?us-ascii?Q?d5GxiKSGRo3froKL621EjXExXc+K5rhAqaLVVkZu2a/WAEMvMJEJxpmAOaYA?=
 =?us-ascii?Q?NsR3navU8MQTM8hL4yf6A8CQErE8tkq87Jvfu+/r42IrFllvKvTCuFsTMWyL?=
 =?us-ascii?Q?Qshn5EojVNtpv+CH+J2XcbjqDHmLkoodf8n9ke8+8WONZ+I/iS657nC/IvTa?=
 =?us-ascii?Q?LKtkr2VL4XNHNpKTYR/JHHrtTusUuI5cC3GMmemQDTKLXi1cA/o6mmRYKQP0?=
 =?us-ascii?Q?yvlupmNi71Rg7Ql0bdntQrAC2HIplm/FwKmbRwDU7DwbgZ27CO2tuw6bH24s?=
 =?us-ascii?Q?PUPO8eOc36vM+fdjHtvBt2FOXYlYfl1C/GdRflgDwQxEIDqMjDk8oZ2qSZp9?=
 =?us-ascii?Q?sSwZyzLj3785svASqszuJvTM3nrIVLP2jOPMBs+jx0jLTFakhcjf9F4MEbaG?=
 =?us-ascii?Q?bP8R7oDIGjPtlCqOf7n+NFA2edxPaY90u9sl08G2VD0mLpLfBYIM+KSp1e6f?=
 =?us-ascii?Q?OTK3xrjb9NxgmZYzgAltngp13PeFtBno0rtJc6clVByHhX+GrqyMMDDfbxme?=
 =?us-ascii?Q?fMTd7mnp7m8otI4dv0rG1CnDtGizE/aHgT1xTyCgCMKyCMzD7+BhhkFeWdSj?=
 =?us-ascii?Q?Eo4SmT0vagwrUw4HYlFVpe7qaIF/Ha3d1ZpQ1rhLfklCIIJrUvzvYGIkXfF3?=
 =?us-ascii?Q?SHfbAW2acgYd/DbERITS9inaNliZMyI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed0c60a-b5e0-4a3d-87dd-08deec067285
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:36.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FR6HUQK557w3tPOl1LO4RwcmX8IaQ1NnYsb7TM6vrjzdC4zC9kFNOZzXb32/8iz0cx1Ld/8u0JQVPFybXAwMCGRr/Y/qzAhBsfviL6g8Y3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

Add npu_uart pin-group support for an7583 pin controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index bedcb6374f1a0..0a217429b2cb7 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -115,7 +115,7 @@ patternProperties:
                 groups:
                   items:
                     enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
-                           uart4, uart5]
+                           uart4, uart5, npu_uart]
                   maxItems: 2
           - if:
               properties:
-- 
2.53.0

