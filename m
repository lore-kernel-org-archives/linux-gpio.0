Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A323DDDAA;
	Mon, 27 Jul 2026 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138175; cv=fail; b=MOQoRAVVGlS3q4gPBfW4t3BVBx2rd5H/EcpI9XHXR8WdaKzZRrwiJZvTvLfUElG8qQ50KUdy6d7z9BDIqsOePMcDr7vLMTzSz+AMIfVhO62No3ckoL87kBtUq6QAn87Pe/+SV/rxMWJgDjQ7orxnZEHZdrU66/MDRQga35R3RPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138175; c=relaxed/simple;
	bh=Ssah1CmGHrBRJxC2L5sKMpndo6L14dJuCk2JetrEtpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EiWQX+S3QOKIwGHy3bCghAAzyxcc6zV+Uy82npCcmH3rp1VSJC/V/AsmOZ88VMzopN4dVj0Nc/IHhy6TdTceQnOkDlu2anmFQElEWIS1iJ9IoJXWqV1kdveluJ7x+s9Y4PLbU60ZBUWkJkzmONu+/Kolt7Iun+Slg+34Mvqdxxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=AQLFjD2S; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="AQLFjD2S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r39Zezlqgy5r47HTpuyVz2Bu6N+V63DWj2VUY6Sm+svBxKM7TfY4V8cq/KjKYV0CJpXxkCdW5NKdLtaqdMTaivTOEau2JnKIdcfinqvGwrtsw1WjKpaJzoPnwhMiRoLufz4dNhAEbXt8cCk8tA994L86l6fiNiPV0DF7toF3E1PoEWSSGqV6Dd4cotdpTy0JH7LXJd2Bn5b9aQjkbhT5fqX+2QwXycAadqsIFRcg73ISTeFn2wfEQ+LeCJYesXsYzq3OROS67aAWNQ5LDHqAbfvFYxd8dbai6iuJeiTsF7BhFPaNw+QHLcdal8PJptQvXjyUp3kxZ6tHbAsz4MzqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hpfM6C96tHD8pb0WjWpOz4fMIyvGJA9mOULxz9oP5o=;
 b=MNlahmcN/J8QVXOvOHnlauPT5UfMmX1DjLkq3XplFutqeeVRv5n2xIJBG1WFhxD1vvwrIl/pkSFtgCfMvVqMBxyQdwOH+sJoY5R6nlBh9EU8NgyD/OoyonQAISs1PHGrkmwG+ygJW+00/UTLvbdoNXexCAE7Uu6ptDGJIp4w+1g8jrNneiGzzHUATHTwMA3C2oJS9NSYWCBVjynHfl2aW+twNQp9UmuBqD3p33WrZW8HYUHp0JNyZ2OfbBp6jBJY9Iadd4idCOVpkYes+DClpENtqr/a8rlIufOUUKbGXa5EIwX9SjIRS6d/nt7y+q82UKBM3EN7nCDTsSKVgwkdSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hpfM6C96tHD8pb0WjWpOz4fMIyvGJA9mOULxz9oP5o=;
 b=AQLFjD2S/Ju8ZAEBxDvm05T41EfTaw6823SGBMim8gB+oH7E1wchyxeH9FNz6DLQNKzCwwKfnPgzjg9ONs1TkunKhkEx1r2pBEB1EpJ+unhHHrSByH4SWLruJ6i6fojEdVduWLryp2GrfXTW4T8SNRU9U/PYXZBaOOA27u6u6A2QLhIYAWYiSPz1GWV5fbF+e4lbTP0qZi3o+lRMT07+DQ73L7L2GnDkaMNAkM2VguMHWjZsOdrK7s0LIOVj5zrXzcXwf0S4ISbcP+y0cim0lDt63L/PGRnRW9ooJIMO9FV5MmQDangB6qayZN5apsvbTwuF7cO5b7cX13a9xK6GfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:45 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:45 +0000
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
Subject: [PATCH v7 01/34] dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function name
Date: Mon, 27 Jul 2026 10:42:01 +0300
Message-ID: <20260727074234.3761170-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f23587-11ea-4da1-979b-08deebb2a5f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	kXzpwyI2zb2DxEgqd6+5f5L/3qUEpMA8jb0dFNjdsXepoL7vPixWYlEhl7J80aRV5cHfHhG93pIHQG4FMnoQK+Du0dymQAmVGWPB6e1y+FeeAnzqKRlSWotUn7nWS2jNccAcW+fYURUClU+s2nwweF9vRWLTSHxKEaFnsafgCg98q3CkUo6e7HdbrYIjnMF0dkywaDkJXauHgkFX98xsKUVgpplLZDD72a8HGe6WNnXJhiCiWIh5uH5puzMTfy1Y+ZeRUaoxzcl7JIKFjTGuQwaVJ+FKMhu5vDxNCaLKn3g5D1zK8P+X1lW3dUM+v9ClmIBxbPuplulYx2D0OF7LLNvuvkGJVOK4Mc85CvXXSt3aN5UtplRV1Z0V1cdUMSkFY9TKB4qF5TSqFCtZC+VmbEEt8u0AwXh26siTGPMSHQQlFh3rzyT/iQim1/9a7483wh5jga7Ei+6JX91gJOxtoC+97BPe3XFlo3FwCTDB2Jhtai9iFyokuhLrxqrY9rbi4M6pTzMw5m3tFBSyWb/eUj++k/zSHfOq56TsO1Zr0NQXdtl98vbx1TBo22pFq+XP3YF0uaefU5JH1ZtAUhn4qTr2MVgePYj24wjXcQCnO77YMxB+GX6bRw6mSJUQlOtXq6IkQlbT2NWVuGNZRXnoBl0UT33ZaqeFBFD0cc+qGLXKA6tK4Tx1TBhWt+85eNLrMi1gePwYJo283aGwIvBT1yOEKu+rTHjP1mCsJnTF5MtA4fgCCo/8XB/bZw/kzfO8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7if0DQtnq5VhRcOyW+LPukkoXYW1fgWHaL6wZYGRcgc0wDskeH+h/pHSxMlg?=
 =?us-ascii?Q?+2JeyQPptte2sWToiDaYPwr1LAXUNbcm/tdN6GHsv2XFNoSsNDmbMqlWGdFk?=
 =?us-ascii?Q?LhhzOCUQT9i7GWasLE64TosKJAYRq5IHPxgmPm/3tzgrQif4Y0iqpgOxFz/t?=
 =?us-ascii?Q?M9Pw9xPoRk4C59okbqmGD6euVjYL2lqNMI8813NwjW9JuiMivndm4/rMx2IU?=
 =?us-ascii?Q?qffMu39OyIVfnkqaFThAAnDQIZRwo59dNde2V0ONM0J0/tL2yCDpO0hkkEBP?=
 =?us-ascii?Q?C9Pcwm/oSHlVWM4y9VQP7PPzAxsIR+8mFrFGCI4eoKOCiYVSgcPylzm4pYJ8?=
 =?us-ascii?Q?gkdTJIeKkx3g9sh5ks3UON89uyOTLdsKCLyJwlN/0G/g4+YEYbXVWTqRj8jh?=
 =?us-ascii?Q?O2olwmpzdPonEC6Jp9l32YNGPVDppecsPn6cVKrBGX2DRj4iBXoUP7NtAbrN?=
 =?us-ascii?Q?6+dNuT7WYgkSr6x8Go/psN9xSH/Hx43kPicnBhrISHsc82Sw/Gw9qq0cvH1O?=
 =?us-ascii?Q?NNhtMZ5pw2k1J/nr6Y8492WPoaR5OAp8selIRGl4bdjj7C9JeuPpNRLlzQi4?=
 =?us-ascii?Q?GnqwpFel7JIHNfMOo7Lg0Ta9dpNyt3O4CJPsd3plQ7HNDu34yQai/zRc4x1/?=
 =?us-ascii?Q?gVqEiEXWIXAfFB4Im4iHp7P7q25SUDwBXZKz6nrd7k5rVsyuIoCXwShwdhIM?=
 =?us-ascii?Q?lAE/OuoJ9faZErArBOZ+E0c0SRJ4pSYFIeVqBxvjpmG96iE7S/vQQvxbKkxa?=
 =?us-ascii?Q?h86/wWeF+S6iavVIp4+wEVjyjIz5iKaTqhKLi1MAs3bdl7J70DCUxAzBO68t?=
 =?us-ascii?Q?1LrvlDeQGldlO4Pb11nICrfGrLihkNy80odO5o8nz8ZVBnbI2BE1eRxBptEW?=
 =?us-ascii?Q?TedBtJd38AGzaxGswZHvfGYPklRxZqXPA9v05N7fioyx/DIG9DGYKMC6rC9n?=
 =?us-ascii?Q?8ysNUViUn2iVtKymnRheVP8zMrFBncsXw1MZA+qjbpAUct6fCOKYDpMJbHN3?=
 =?us-ascii?Q?BHaFer6nYPRoJYF4tnltc/Slk34lKxo6shCF5JFWWrBafZaty8iOjGtq0qBv?=
 =?us-ascii?Q?qvVJZKHnXOB8bCkfdp9rVznrcL+49YS+KnhpkW/nq3aKQTaET65bCgfeVKwq?=
 =?us-ascii?Q?LEhbJZH/P8h7c6CLQPCUxMKYcOPzFifDbH5RZ6yYU+RZ0kvsS2Vw4jIVHhTk?=
 =?us-ascii?Q?yGceNr6f0RvusjGljF82OeYLWt1dnT79eOQ4ftjGfg3wBfBNqSa7bKxJvPEP?=
 =?us-ascii?Q?wUFGHqyVcTnn8/OhHfJ3I4IL2U8Tbs7Bm5qATx/rgxiiE7hKt5CwADrooiIb?=
 =?us-ascii?Q?EtJypvj/U3tHZp/ZX4LIU7eo6YpqVCoIC3SvdmDDOiQLZW7rt5Yq1djlTcbi?=
 =?us-ascii?Q?SddxA58oHgi5x290Hy372bzRJzTPIGPUfIKtdF+qfqEHXqxetW9F3ZjtGM4K?=
 =?us-ascii?Q?Dbz+p+K/DxF+uHNThJJ955Zt6dbPq5jCa5JeH/wE0QFIo2wf8kIj4d5QVOP0?=
 =?us-ascii?Q?XQBRlMs40UMa39UrV89Wy+C+XHUWmfnZup11n58ZXklMWP3k6gYJPvkO2kCg?=
 =?us-ascii?Q?IP5eLzoFFxCDBH9AV1vuNsL/mtJ/SkkOPs7oFTzYhMI/Jn73q8WxqGQTq1Bj?=
 =?us-ascii?Q?SgVSfpTJSKCvQ38S6Nqcu3BRFqFnsTdN02KPhsMMZ1RWFpWRhxoH0ryxQemL?=
 =?us-ascii?Q?R+o9SnkbKvYbbVoAETckr3DHM7xYeeZPeXIdUGo6w+X3LyrOEdS/BU4x4/at?=
 =?us-ascii?Q?PLPztlxshipLFmZ7Nn031gF0Nla7zl8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f23587-11ea-4da1-979b-08deebb2a5f7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:45.5911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCu/+5Dsd3o83HXUbLxusVGVviHjWGBQ7OihVSRkhqYKfm9pNKUTX6j2kO/Gn0zMXGaSikZRNF0TYUE9CNmx0VrXd7E/3A6PcT2hz+1AoTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

i2s pin-function is missed, instead i2c pin-function defined twice. The
second of them operates with i2s pin-group.

The patch fixes the misprint. It also match actual pinctrl driver.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 21fd4f1ba78b0..0c5a7eb6d563e 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -166,7 +166,7 @@ patternProperties:
           - if:
               properties:
                 function:
-                  const: i2c
+                  const: i2s
             then:
               properties:
                 groups:
-- 
2.53.0

