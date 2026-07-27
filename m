Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6742C386566;
	Mon, 27 Jul 2026 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174122; cv=fail; b=V9wsjUMyxjg9rayz5n8r77Gvy9Qp+bdAEspTgTCdf8r8XInruxA2HiimS9+2TOGk4kg7ihdM6WSPIc3/RMV9JO8afqvvxqVpDDvu6vq6n81MTazumOtxUJXNXRDQT9x0AcnNLPQqB/NEheCn0pWN0KJDsHbf662n2Wur+oOfD0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174122; c=relaxed/simple;
	bh=jNSpAe/+8MWs8RGd85Dye96LuTBexEwl7fi7X9QoriU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gYt9N41ClKO8XlWlkRS36gX735JEfKsy67DrjTq2MyMUUBjDT70TTYfWZIdteZMCv3gaVghZF9NjPNIUlc2OKIbboPFFeLwpoNXK2O5CuqLZbleFBeD58IIFZL4OMmW0LW10AED8UyXu3+kjgRHQDSg4qjyVpy7RzpWeGywy3yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=BtSKcNsB; arc=fail smtp.client-ip=52.101.70.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="BtSKcNsB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U74qM31LTmvWtSXI/fgwMmEEz45VhIxkyU4eRLtJk6Ab3xCogA11xzR+4fbWojk3Lp/q0k3NVZgq57RZeFF/NSXi1p1qxzRCQq7Py34+Daka928Aid2TlhVOX3QQaT4Ud7g569lPpjf3aUoHLG7sNeYJYXXawraZ7DDijfo82yspYNMVOQC9gNP43a/ugkAG2tZlchmkHds7TIvwzKpgGg71TH/WGlTx7/Uo7I0RbDnoi7noBGpG6Vlhv7B2iS3bDepYTH6cOf/+1ZE6dmAnjQI73j/thQFKqZKbwgX0FribaX276Pm2DCs7RRwiKaFWOX06SOD9OQRMgcYDThT7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTv1/c/ULkVccQ7rasbwg2F2bj9G7I/irTLLjkewmT0=;
 b=aesejMNAlyj9ROQxmkJSU6XP9ZvcvdE/rQ+3wYeIvz8TdfNtDZ+Aj6Bwlk1yzqDZs3rEFK2UYSDPY477sKn6rb2Z/63V7wzY91DocbGcWIs5AD3VUWaZCcu4cygVMJxHX1JhljgkPQk2vLFWyvYpmdz6RaiFBqc0HFoc7w9IDI656hT4qK9oBJLQrMVh5QesYx/MbYamxnltth4MiC2o+o3LTRUEeI3AH+XlvLYJWEHakGHk1a3iwAIDrpDX4+ZvO2V5wIhAoLEYB/iVzUGWnR0C5lKJdqhRQ8N8omWRiUjah3IxL/BHcJO3/L+QqySwdmYF3ZA21IOBWmD7iH2CWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTv1/c/ULkVccQ7rasbwg2F2bj9G7I/irTLLjkewmT0=;
 b=BtSKcNsBrOUiqpr3gen2Dd/n4y35ngpf/daPcuBz+mTdbifveV5mkkDPkc82bught1VHhs9l7nQr7NfRr6bWL4CPJH9RkONumYOF9I2y+yPqtmZRSxmCrvp5YnnSwV1nUxaZ5N6YRVqJb6z2Mnu3X5S1vk023NKbzurY//LBMaBEZe0kU5aByV3qig3OfX1uioJZUFYoAKBw723xFGPRUkD1Fl0HsltDIsEZScByIS/62bNN/N9iwwUTTwJJBTeFJhMg8TRm9d3VlV+if5i/X9dY5RXmPNP7RFCszFHVs9s0fwef9r6/UdwS9IAjLhYI/CzE/Cd98nlWMNqtKdqe8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS1PR08MB7537.eurprd08.prod.outlook.com (2603:10a6:20b:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:41:56 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:41:56 +0000
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
Subject: [PATCH v8 01/35] dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function name
Date: Mon, 27 Jul 2026 20:41:07 +0300
Message-ID: <20260727174141.664933-2-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS1PR08MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: efc0520b-bd1f-4223-d385-08deec065a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|38350700014|921020|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5VNTz2SLyDTpUi+Gx/U3JyKzJ8bok9pswk66f0nn080XuC81ice9DXSj5USNa6dRXnBUp8y0HEVNox2B7RszyfSyDalBBHcEGv2wjT3IYDEVBk7mxuGaVE42WhRcnodiTZbANKWRH6cc4DNNNIMk96eHmgB2dN2FBs3tRYowGAqQy6xRNV4LAClf82aelpSOJYLZFxyvURsE70SZkOivDvsCwWx6OKLd5Sj1fyfOc5CRCBNDk60+o3SU2KPL/TnETzix6HAwi+u3fI8KqXuWWfUO+7MdeVuWOv1Ew4yFOaEm/55Nj3LSSXUPDdSziVHeScE9NcFTEEnQTrlzOT6WROdZdEkNtR3fcmZUII+IGy4zw11+WmIPPvj/OgIHIR2q5N72LV16AkIYze0Ds08GK783b/C/KPofyXR1PjasSVDMAhHJpRrj2yLtj2cVxWV5qXVOKSdiDDE/dO6o4iYw5TIoS8K7Uq4/BB0IuuzwKSyxUJf4h1ihjhvpqABNAfa8jfhOl7IKYUdtwcn/CuxM7Yl7N7zaWlEmB05BQXeCUM6Pnlc3JknBwuCixC+1OIpXSjrt12a49tfBblCx1EHnnNIL69EvzE0Q+sFfKfXXQwjEpmGtUXAeKXb5w+QDGR0P7EP+7VEIRWBNYdlwIUKMUzdg53bu3FS3RAEVzWrmgsNsqXLyB/i5om4Cl7puxuT7G/DGNhhjlkIUlHM0d7JFZ99w8aKLWj4HLLxotSsxeEjjIyuCxPz4mFGyaQEGpVw7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(921020)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0hA+kbvwxNC8C/maMcljng0w6JOcz0021nt8oePh80Bqy/+KfqIHdGEuSANc?=
 =?us-ascii?Q?PqALIQdkiGgp1YA/oK3EvqP0pFmAILFUXC9fCzxW0QouPurJ8Je3ktEg1lc6?=
 =?us-ascii?Q?9gzblr+TjTHhasljGVWBRIZ+ad7na8hnclKBtAqN1/bTJY31TgSmu35BA8Y5?=
 =?us-ascii?Q?xdLEbgOOMi10oMV3Yshkt0knIjF9+fAO/yiUk3jnfrfnOwFhlZZWsp39bt3I?=
 =?us-ascii?Q?m1vy0gki7uDV31dqNEzGC/4vtz41HYE/z3IlzgczyuJcOo5DKCfIequvJhzi?=
 =?us-ascii?Q?fNI+oJ53yXdEF7z5HgLxjH1lfkosO2oJ9lfQhBRI+V7n01JDzGwyJc1MZTBL?=
 =?us-ascii?Q?ETMhkhVaLbsgz+XpK2atp3zwWjchwDrSw0hSyRxiyP/yp2u7iu4Ck9DVMtGV?=
 =?us-ascii?Q?Ltv8HwccUxOlxcOFuOYsBnI6wuAYE3CVUF6SLbJwhWB3jtgQnXxVfzcKGvDC?=
 =?us-ascii?Q?J01O4h1+WqNlcm0RYqgyMojmpNZ67ZVtPWmq/oO3zcEzh5MMZAVYp8C6dvdq?=
 =?us-ascii?Q?wPvirjOWBW52px9TT1rRbGXhQztsqNOj8KVOAZFhNT69CZNUemezfWlW0gZM?=
 =?us-ascii?Q?5aZXlEDxmQeUD+rDsKy71YxUo2QmDyGuPLfP54VUJkGWC/ImEOcIYnUXbrR5?=
 =?us-ascii?Q?CF0+stnp61fhcNaFab/pWI6ICZEEWG1wOrviRf3db/KjAMS9611v4cZWBhdd?=
 =?us-ascii?Q?cu/rMySXLkH6Y5YUqa1P6N1y0hKotzhaltZSqPKIdXKQUK2KoiSenK3X3BmR?=
 =?us-ascii?Q?vAsG889rMzCVt39odIJFvEBgNJ4eUqZ1sEyjot/nYPHKUxwLpWSdn9QltBxk?=
 =?us-ascii?Q?PanevyxsBXeCZD/caTB9l77Rc5dUh9G43tTWc+c4ECecoaZXUP0HfXCoqn+T?=
 =?us-ascii?Q?BsLRhUcL0fpT9ZLV71ISpPzTDf/EDTmTSny6gadLe4vJl4ft/t1/0mRpTe1s?=
 =?us-ascii?Q?8+G9XIjCIVv5Hy9RUMAa5VcbcV8Mn9Z6FUqTFhJG0JH7oEhcacaAD/Of3Qjn?=
 =?us-ascii?Q?dby8z52fA2OQYsJeV8lQvi9AJMfqcpPOjALCj57o46C5c/POrGg2XMwh1erS?=
 =?us-ascii?Q?bucRbNkk1vqF/IsQvMYiQMjoHvD3FdMoUR3cPzK4u0jE5I1SVGStl/mkhEum?=
 =?us-ascii?Q?9wHCRRpIMOJscpon0yp574lL6LWD1fijwKcWh1claN/lTPGzmf0ANSfGECHf?=
 =?us-ascii?Q?0o1yxE2XKRe4YswHKWaJ/2XD9eznS19HIDKNj8MBd2cPaxubepnXQs+JEbTQ?=
 =?us-ascii?Q?Lmz2/KgxqWCUe9Oj091pvPZntKqDjhMSYFnt3mQo14dTw7NxisUbA56yU+yw?=
 =?us-ascii?Q?zm0CEx23CjDjE1+FgNLGO5FgakIS5pN6G5leX7l1cwuVXON7u19drAdAZuRA?=
 =?us-ascii?Q?YXnj4sHkbPW0Q4VURMhQVCOuG06v47HRThTLuSJ8/UOZ5DIY9TPNTqySZ//5?=
 =?us-ascii?Q?qD6rtWdtoBkt5iyBxo3t8F9hBZ3Gd9q0aKxAU407q6qj76qH7+7y2E7siHMl?=
 =?us-ascii?Q?sVToV06TxKEfGMq1ji5pIuMSe41HlpZV60mJyJAsTdeyRwYg5YYw4HVQKIPc?=
 =?us-ascii?Q?8CMYEzyFcd5283jJi9vWKF2QJZD7fzNkYphKVTBp/uJA7xVIj0Z7Ae4Gog4h?=
 =?us-ascii?Q?/8eCu1tXsV7ISI94CYCfQ+6L28/G8ynyskX2nAZLF+I5mCGpcGZ7Sc0MMkfD?=
 =?us-ascii?Q?vwul8NDjBajTuoSblJiUjWmY4KOhUyXegDURM6c5d8S3gmbCxbUBXcViSUS5?=
 =?us-ascii?Q?pMj7yzVba711xOZ1qiT+v9F/CeWkW2s=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: efc0520b-bd1f-4223-d385-08deec065a23
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:41:56.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5xe7rfHqbnFdsBYJ13bHQy+3EFB2YH3kPGhV9Ou738CiFHQ5hBAmkMXrX23VUEVMmNjv//s8isbCW7lHzHWVdlaBcYmOdr4YXCqlR2yd6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7537

i2s pin-function is missed, instead i2c pin-function defined twice. The
second of them operates with i2s pin-group.

The patch fixes the misprint. It also match actual pinctrl driver.

Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
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

