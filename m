Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013026.outbound.protection.outlook.com [52.101.127.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1393B3B71A0;
	Fri, 17 Jul 2026 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285962; cv=fail; b=o0bb5zQLuvSoafO1uiSXIG/ItV03Yunz0gni73BiZ4QPUyvW4fFR6ikguvlv4Okx8qOxV2U5UFq//1HVTvpffHOv4vPeBTw6WmdC4A0lytkTkMHHtdmPk7EErTiGrpibsDPsZJLCcx/tT5ObciMHWb9Gt+XH8FdGb8H3cnHveKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285962; c=relaxed/simple;
	bh=q/MzsJuohNymgUwPJxoAi/tHWoGLqHs9ePpuJz4FwC8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MhQcOrZeBbrl36asBmikhe4rBs5zDsI4fFfemmouoyAMFvd/4qtMl9Bio+LA7Fw3c0MEq3epFyBDK/Vk3rmeJFxMUVkebFzSxUSz2BAQZVnnF4C3eFB6zOvBERKuNPQjsWp/qI2RucxGr81r3Cu4O5sXhga3eQdrjJ+80RhP1TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=O9mmBdBp; arc=fail smtp.client-ip=52.101.127.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="O9mmBdBp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhA3XjDUemClJw7cmFED7KOgXS7qPkXnvi1T0ay9KD0eSzqNg0C1rrp0AqRQZM+icaK7eJp3tD6FZOvfRu3/hFJJJbz+7ntTe52PHnOsrZ3gW4sbPFnootgn6BeXzeXmUn39XBqVlD3vOlLBxZMcpwOKaruhD0Tp7h7YFS9wwD3MOk/KW6brXGjUF6g//Tu2p5HXerRiL2iW7gHS+7EARJ6uqstSl968IjRNQeh7t6PTPWtbj/sxIg0prJ9Pa1mVaxn9KAU+iOZALNrVawFij4MMyRWt3Rd50he//40Z2qnfANWBFI+v1R9UuDdoo6sJI1FDFrYbatnGgFL7BdNptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJxlHgkWxGGHMXW0VfLZHkZS2m0ImYAVxD5wnyNAt54=;
 b=hYo2P8WOaC4qOvIYB1kv86F40MGW1mnIrkC2PkHGTFq7Fy118SGzXdjVS+gl26RLez1w92Du6ifM0eWeJPxVPSVPcCJQ1h1QA6ubdd2eEZCt5miQeaYkc4QVIJBFB0BKxtULM0QapNuXCo0n9MKY5AoMqK/rfwYi7TqeA2Vmrg6b0TYzcFYCzM8rhlBqyq7l0Fc3EdYlzBKCD8ML2mXRUrQIsLNcNmUe5aeczBriKlzHs6vGmpsVQwj8bpPoHLtdxBj0iMSsIBOfZhRgpFbS+aHQSiD+ufBwr4OWBuT/nq/l2VjaCTswvBGxA0uRr16fLJWyNllpU579LaeKAZfttA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJxlHgkWxGGHMXW0VfLZHkZS2m0ImYAVxD5wnyNAt54=;
 b=O9mmBdBpgXHs4Tlh08bKf7agesPlbL+ZhVK4TMCEfdrMBHQJmH9NfYje3sRHxw9Jw8gYS6aswhwn7OFciO6mrGr0oXAMw+HvunyBLbSHxL507rBpduDUkSiAE+5pkJ27XH664fl4HiGZYWWgr1R4LS00r8a1Ji0ioPMJQkuNSc+9UliSNj6vm16/M9Li673ovkY7P2t6H4BfSnva7BEJYk7cxbc37QQW7As61Z4O5VA88SCM6CZc6V4RPEJiT3p9wOEn7zYfZfHQz/WOe1qwVKxQiW1qQI1D12dazV461DR2aOlAw5Y/4pTJxq4bZo4ZoJjcxHvLfU8V//Rg1rjxDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUZPR06MB8313.apcprd06.prod.outlook.com (2603:1096:d10:64::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 10:59:05 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:59:05 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-mediatek@lists.infradead.org (moderated list:PIN CONTROLLER - AIROHA),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 1/4] pinctrl: airoha: Remove redundant dev_err()
Date: Fri, 17 Jul 2026 18:58:43 +0800
Message-Id: <20260717105847.131359-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717105847.131359-1-panchuang@vivo.com>
References: <20260717105847.131359-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::20) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUZPR06MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 31162a34-0c59-4860-956e-08dee3f26adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|6133799003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	et9auvwrMZM+xa9KQa2cbKKiVeZ+Eum+CIVronsJZQQDIC/zYGMM+nB55wGlWOy/03iPIUtT2vUuA94b4UAKHQ1FV2mvZWC9pSJSJHpZYbVbkSRFdc6tKin6djRTAQOc2PVwbq0OMynLg5rJIUQMrNjGUt27dfJd5urM7Wi9MXI79w3mXm2rXIR5zvmiizIS7DL2Tsd/Ovb0OT52hSBtGNwU6Yaanbeti4PEhsqiKaAT5042pMuDlp0mr44ndtkdeR4/WNqtvoALWIuIZNy2FVotUqJUnYVeOqZATs+PxttCmEqVd0zd6r3F2xwQwNijLuBmrXxLbtvCaRh50ucslaFErkaWUR59MwRxgteIwRHfeFl2lnd3uWdu4e+PDX2h2PxTp7mhGNI+xT1XtquAu2F4vSauUVdCQ7b/XmzZ2fZkz2lRv6dmt2PN9JeB6UZ+CxrpJh96M6VKmQlfXO6jxfSpo+rulQxvMyjzVpKc1LK1qcteFUXVXtTfABY6wM5S0i3aH2DwZ2Iz1kCFsbVFuLW+/SEcTo7VPNaLnxsgYjuVj05EwPvstm7UQq3Yf9MVuGPu7ETjswK6OZTVl1lIS78U++jB/G305H1AVySwqQhsAWiOwkijZlZK3q/+RDcSPG8o0BYQ2/9lJdzBqhYyJS6/1eg0b14IEC1wB+ATx9EUwPCVJIR8u+M/k0ZXOPIhoB4JwWY7xobFNBQV7PW0w9p9qb772CN0K3NWp+76uYU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(6133799003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+bQ68eJEgo3wt3RS8J9EDC0FNNbzFhWRuEjZvJ+Sal69mA3AQjmQvS5xLWWe?=
 =?us-ascii?Q?x7fWy0BheAw4L9TiWPqMibB5sL0Fmh7/yfTa5S95s+Tnz2JYLFMn5Ev5mxk4?=
 =?us-ascii?Q?DoqrA4DBChIlFLVpkrPN9WBiHkxAmq2X/26TEcEdD7cNFsd+6cSfnUq/AjMj?=
 =?us-ascii?Q?Hxi+0m4nRfHVtzhM8lHu41ftbHak2NbrZIV652zbbS5tkdQfElKWIN5b+TWI?=
 =?us-ascii?Q?kqa0kme/X7jAfnwo/jBLiwvbUDvBh811/WiR64EhvomxPsBljHddhXLYBtKh?=
 =?us-ascii?Q?zFb5YBnYwIM9EZkc3niiBO+vtbb19ClkLBnofPQEJSjJ8k8fAmwqKTPibWHm?=
 =?us-ascii?Q?+Dhe9sL7GLl8VNTjlNTAsUKk4YfYnNvbfsYMVatKupYW5AOLarxu7hQFVDfH?=
 =?us-ascii?Q?0xXjtXIa/cMMCrUxYeWRkwM5nZyJ4LuwCMTP6OhVoFZe8Vg+V7ki0YleD/NJ?=
 =?us-ascii?Q?YMtjMYNZ5QUTClGHQHNGfbbgU07ZM0hbKLTyXcJaSZE6IpYkXtx5l7wvicPS?=
 =?us-ascii?Q?nZmklYcNp6bX4yGXpHhl42CDV9ZNgkykd5/S2/8MlmouCg+uiPiKnoThV/Ki?=
 =?us-ascii?Q?7ozjRmtDZ5zTaoickJtBC1ulkDTc0Pn4nqkFbngb0V1tMDwsx6gryX0/UlOv?=
 =?us-ascii?Q?/X8cEt5ZOJxMYirBpUNylq64NHmAdWljueMx2f+eKV7gQ+yGPoVBXEmfpB2a?=
 =?us-ascii?Q?mBHFkeCRUslWUGKHsy3VugeS87N3TMyqyk1vJuOdq9zwpn8K+jMpNwMbUKJ0?=
 =?us-ascii?Q?eg5G9RW0Az6KyK1s4amLgZacB60agTPlgUndZw4J+15MeuOJMxO4W27YtDUW?=
 =?us-ascii?Q?S+ChDoYSpOKrQojjVqdL3d97j/g0Oix/5hbukVgVPSNmziBXyWLv5TqXxwTz?=
 =?us-ascii?Q?f5AlBMIckG2XWb2Ln/f2ef98C++Hz098VBjN5FLiFJp2cuvHEal3q7eLPhzH?=
 =?us-ascii?Q?ja24ouN73QI33Bee5x3nQA92bgSaottrUP3kTC971L/G4i8UudwOenrv+26L?=
 =?us-ascii?Q?vLkRpdLNUDC0YjnSpxJamTwOu5tBzdGAwsIDLrIFQwQ9YarHodu+YxEu8WLi?=
 =?us-ascii?Q?GADOy6o7pwdlU4N0MhdSmpgR77sZRhx+FDEDeEdfyg6PR4e25s+ANWSX8WRb?=
 =?us-ascii?Q?7q0m1aFnTfAWMywDIpaQ5VH4C2BQ+Z6+fieshNht9iIfhk6Gzqw+7YYWUI38?=
 =?us-ascii?Q?T9m60sB3j5bP2CQhonZXTufrjetINFKQepnYilMlnyTZLQhQCoziN9EmJGlM?=
 =?us-ascii?Q?GjEDfdbROLSoo3y3ydSp2ZpzqGjbdOXVAJwoj7Ua8u8zil+JOInUEtyoZrVW?=
 =?us-ascii?Q?bnI5RwFz1Lu107WsGD8GhGXes5AzTGSFQWE7gQy1uNQUXOWVUIA3XkY/REun?=
 =?us-ascii?Q?wvepxIKhxe0TIay79TOu9ClsXdi2HQDPQy1TQdz7DjKPFAl5EbIyNJprQOEY?=
 =?us-ascii?Q?kUmV7XLcEoaB1Ve5O2J4rbjmFSvEhFoIv/T6nQ8WN9XOrhUagaPCVQk9Y7JR?=
 =?us-ascii?Q?s1blLoAWM90y3pCLV7DEMLtCEpHe+JH90GSETe4ojb87Q5hsaCZlmryHivTc?=
 =?us-ascii?Q?gSaLX9Rs00IXp8QSeXyIMYZTlvSwXCSwGkEZUNiXPhOV5s+az5XVglDJ6rgR?=
 =?us-ascii?Q?t0NkBKg4hWmsKc2uqZmtc/6uztr7lBNj9cLmfHraw6BWp8CN/M7ScwNauDkN?=
 =?us-ascii?Q?VYRZcZR385pF+QGEg0bXyWFG7P6PPJi+pnePxqL8DAMkDGvGz2uqowdiFdSC?=
 =?us-ascii?Q?BBy7g64kcg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31162a34-0c59-4860-956e-08dee3f26adb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:59:04.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrbf09KgGbP8O0BNzUGGcDoWEhTT5Wu30VdHaQz9gzIrggNgbx7k+GIhiqYT+yzi4zjuLjWYx5A+h1W9218+2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8313

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 04b4424c688b..abfb018f207e 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2519,10 +2519,8 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 
 	err = devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
 				dev_name(dev), pinctrl);
-	if (err) {
-		dev_err(dev, "error requesting irq %d: %d\n", irq, err);
+	if (err)
 		return err;
-	}
 
 	return devm_gpiochip_add_data(dev, gc, pinctrl);
 }
-- 
2.34.1

