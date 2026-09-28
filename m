Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023105.outbound.protection.outlook.com [40.107.159.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575844D7D2B;
	Mon, 28 Sep 2026 17:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.105
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616862; cv=fail; b=s9vKx25VoiH7UYZFE/sFgxNJnCc6A3YIC+Nbshk/A2kY04orB4eNs88M0xIaRhKTBb82J5lCmQUwOKJHxnPBVI97P5XoTdXlucamSccAI94v0Iue5fvVGUG4vADTrHSUC0wBnOKsAWFMZC7xEtvWCgi9see/wJkj2zCsvJqSAPc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616862; c=relaxed/simple;
	bh=qbpORQfZP/B6fqAjJBWvgHjB61ZMzl/Htkr6QN5HBC8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K0ytTTU4sEaneDNB82RtAtULoH0hmg14oFcY1m2KBiVqIMUu9ue65Vdc+hTzuGqLuS1AT7IFYQ7bPVeRmOy2jdHj1A3tm2ezsSeyCrajF3YNxT3XPFf+7kKDg1zRL7cJQPyVKllBY6gxvz/yugx3pwWHHgDANL1ScxQUgtq8DHs=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=h4kT1rpX; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=h4kT1rpX; arc=fail smtp.client-ip=40.107.159.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="h4kT1rpX";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="h4kT1rpX"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hZxjJpmKpCKum/WC5+l04v0hMsuLp4D/LX+1aHyCM6SEzFG4jzYi672yJdABzFQyVf+PRo0EGUVY3HobmChfs8oC4KX36pPLCKp/F+y4r1e8qKhsQvtBcLZVaxu9DlEklG8umCFR5dMXwvYfElV6iAddbP+dF/684Ve3s+KgyeuFxrhcxBXkIrRGDhTrGzKzB5PkZCbcv+JwLzV7KppMfVaay1E3e68q2D13mkJ3S4iK/MP6GfLAp1W/q7fyIZbZOoMULbJGT9+bo19DIOa5eEcxz3ZrPnMFEeO6iQKDyRn43gSdwIggLX1Yna0HXOA6ITWA+U8zqsrvuW4TE5xJvA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bpgb9FKcOuJ3Q6PRwFCfRhcC7HWcrpR96da5l7rS4Es=;
 b=wqzafjKI/LgAkPs2AGSaDUfhzQ4xaHR+YwKeddA6B5i+G8BbirJ5AEvxoP12tjKdXmNL/C0O7ws+AxvlG2Ja8k9JUUrqhmwf9qYN23xlTfX2DJaYNjMSI5apjmVeq1QDyeYhsWyo5+anm1dI7amZ0LI0yp5JBmpzrqpKJQv0uZLyZM6lhCbCKsjaecHmRrytdTWR3y5ZIGVrKbv09fYq24hEY8ABmJXPONmUU8zL1jLFdQUh3E1ZUA2SlNn+1MK/dzNgIKxX7WmUr6mQByvuwy/+kg0gP2iC4YSoCSRWKLqfIe8l8OEmOprsMRG05ydq5YKEC7T8yyM8sXuStDQRJw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,2,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bpgb9FKcOuJ3Q6PRwFCfRhcC7HWcrpR96da5l7rS4Es=;
 b=h4kT1rpXkNqI9VGOyFygg/PQ55PsyWinNWRvYyVAIkzwmD2+4qpZDFdIFiM9B8Rk7BRb0u2SpG4D3M8w/1y05bCjwNYQQVvOvMVBYxccSLINxKqItxY2Hgj1wGO/TCacIxLbMt1ZBfsGcvMaSMx+RT4AbZa+TLNgdiC5vJl+tmbQti2FS1kCsmdT6RzZTmwdQr5puHyTRnDgxN2/APRVgx7SWRSFvikgKuNPh3RFzcNy9F0B2/X7pQk84xz2Eg1AB2jWCY3R6Sfq0CFqyt5YVUANXVcgyaM5qxnl1T9E9VvqZHqcH4HuTmMayFIkS3BBkKqcjANpn1lGXRxjcnz7gw==
Received: from AS4P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::18)
 by DB9PR04MB11627.eurprd04.prod.outlook.com (2603:10a6:10:60c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 17:34:13 +0000
Received: from AMS1EPF0000009C.eurprd02.prod.outlook.com
 (2603:10a6:20b:5db:cafe::40) by AS4P189CA0028.outlook.office365.com
 (2603:10a6:20b:5db::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:34:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000009C.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 17:34:13 +0000
Received: from emails-2570297-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-272-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B5377805BD;
	Mon, 28 Sep 2026 17:34:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616852;
 b=gnhygmNFjDG3i5mm7C86TFSfIBEJ+QIcFYQIKJq07+jyUqV59geth5KD2f0T2wK7frVEH
 CsWzLO2YUQQ5K5gKI9df9lVUuIBjSWlAgC8TjjR1/racy+dL8Zvaq330ElL6+Em5OG/SWBe
 wY4FYS2SnhL/rWJJBuG8RGMETAn9S/s=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616852; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Bpgb9FKcOuJ3Q6PRwFCfRhcC7HWcrpR96da5l7rS4Es=;
 b=oNvX9pyuKrYP1bg2gdwHRb5U2toFjHkeKOS/wOm22nyGXPZO+EXMUlORgeiJDjDTgQWiq
 6U3k5wwWjto0cj3XatlT/5g2a+rv42Mk8LnUWg46aLKrcFLQC+4rMSMCmhrr1M6s0XAJGsP
 NipZjX/+UoTXkfPIGfgo/G5kaWoxB3w=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bpgb9FKcOuJ3Q6PRwFCfRhcC7HWcrpR96da5l7rS4Es=;
 b=h4kT1rpXkNqI9VGOyFygg/PQ55PsyWinNWRvYyVAIkzwmD2+4qpZDFdIFiM9B8Rk7BRb0u2SpG4D3M8w/1y05bCjwNYQQVvOvMVBYxccSLINxKqItxY2Hgj1wGO/TCacIxLbMt1ZBfsGcvMaSMx+RT4AbZa+TLNgdiC5vJl+tmbQti2FS1kCsmdT6RzZTmwdQr5puHyTRnDgxN2/APRVgx7SWRSFvikgKuNPh3RFzcNy9F0B2/X7pQk84xz2Eg1AB2jWCY3R6Sfq0CFqyt5YVUANXVcgyaM5qxnl1T9E9VvqZHqcH4HuTmMayFIkS3BBkKqcjANpn1lGXRxjcnz7gw==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GV1PR04MB9200.eurprd04.prod.outlook.com (2603:10a6:150:2b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 17:34:00 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:34:00 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 19:33:59 +0200
Subject: [PATCH v10 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v10-8-91752ea39cbc@solid-run.com>
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|GV1PR04MB9200:EE_|AMS1EPF0000009C:EE_|DB9PR04MB11627:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e39553-bb04-4324-5295-08df1d86b64e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|23010399003|10070799003|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 yqxtjF2DjQ4Wb/oEWNCvRvtfuCF+f8GZbS6WDpG8B2jUqFJ6qYSK3bCcVzQR5doEpaz/JMaOxhb6dNK6ez8OtAm7Bxac3eGH72l2uCk96hkj3FLEYtvqAQCa2R9TA2S1AUb7hjch+EV0cOVU38TpNUfgf4/bncDrUwMhdgu7nUa+vP2n67zLTTeDULSfUyyVQ8SjBRN4V/zsUfCeoxPYROjdYPDIlctJ62bw/sfSwSmlNS/9BB/0dAtl66VexsipU4E2aIahVTvhs+cw+vnRpNP48kcq1hfHY/dMT1xtKpojAL31quGUuNYlNXnnfhT0I9khZFdRkMyypXN9OiiIK1IZVOP7/38FNxEr7z2EcLJLsNc2UvnacbhjU1CAksYHHrRBh5nK0/OpjvqadzBEJ7qmg8UIeIhrZWdJtAoSlJI0p/l+vtcWcIuCAYQ1U50zsxlWmcW3WAmV7WSqwIRRkcRMFn7THeelPsjgZTcUCMFepf5pMrMtfEk7+KLWgC8bdIt3xAZ4OVHd6ZFvkIqCiZy22zKqM/j9kwW6a/zVnl13zqIGfLj7uWNEVS8kpLdKD9HBp30TUfZy1yNlWK9hJr7JXpr4PMp/kU6rmT5MTKnjb7ZFcgQaAIHwWiNIUpGl
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(23010399003)(10070799003)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 SsFA+ruSQAVL4c9GZ2rUYXH4DxEqCXUvfWt+oCBuFiUsg4qzxf88WOM5XQAZ1ppGm/o28iZL0VPYIC/Qg94qsp39LEPD34xcwnxu99eW4OyYUK8GWaRFhlOEx9PeSAoS4QhYitOHyit0s3pdNYtd4kAl7i3TQm+5qUbpScMBt+x0ZEVAXzGMnesfV9RmMQ2cIj9hzfJgml1vG7/Hxq8RnbG8i19j7eJDnWccIokKFzMziJli6oOuS8Y/Z3xhV7PnxxS7ff4lCMg60kxStHpkhjKhVuz3ALKV9WOFBkNGgMQSP4rK6LFgvdm768o4GckyDThLc18W1tcXjCEEM8vOwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 63721364c63f43cb9a13f5be79bbceef:solidrun,office365_emails,sent,inline:87287daded720ae2bc7e73491d419f2c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIL+9ISbGqhfapTjp9TOnXEspfDpMk/+0p/QuIX+7FPmC3w0TPrhmlGGKVo+YDDe8/WzmHX1Xwr/JcyhHwpalbnFb4F8YsggGMzpg8aVHCBYNDnJdMHELpterfGNG+qyIIrcugv+mHk24tbbQoGGFLc0jMgVx8463E2asxsi3RGBxxnFqY3fjpsrZ9yAM4+uX7PFIPf9baBgHdDBVqaAtckaB35nS6TFvahbN/cryIzXK+RkXEeVLUtk1F1+xqiP52dxzSYjOyWsl2u8QVqTr4w8WzNWf7sMAQxC9FB7wl+IV8f8h4GqbiIo8KcsKFEQV1AovHAfymJQNy56HXOoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bpgb9FKcOuJ3Q6PRwFCfRhcC7HWcrpR96da5l7rS4Es=;
 b=KeNBOT9RfREgAyf5/DBaCdqeWjyX02kcwx7a2aSmv10jwixOlLe5F/5vbmb8WipTtAE/ht58E0YFNP9biFTEtedpX/FmJLzMr4sSs3W47ql4Bep5YbFZ465xgIgiloCIljUKsLmHTP5RwWJDK3HZ74OyX+IN3EJwMNk/xdUNiifZ/L9dRBpY3V7VhVa7TfA9+qkT+h8Trt7k+0kf/JFgQQondcI/l/xl60U4SsVCYwwZ63J7ritM76whgdA63wELPoDTKcaf5kfk1TGa0+guQEGb7fSXAmg5Eb/MCvqjOlWrOi7BAvCj56rWZ+cFd2uAVN14ezcW9S2gAXVv/ED1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000009C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4d72915-9633-4949-8ef1-08df1d86ae85
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|7416014|376014|35042699022|1800799024|36860700016|23010399003|10067099003|3023799007|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	xlA7RSDYCEjnFcy3iQeo2kia97WnrRfIdAW+P11xqjM1Pcz3kOcObFdHTfKUdml/RDKkNhICh3oE7NJ5O5crjtlFc/ZuwyBtYEu43l2WVxY88LKKhzOWfybleirOyMhbDnJ3/s97SwRGcfkYPp7iqN7MbMhwLqdtpwM3Cy8VgE/wxBLjqOQZi0ypE3ipqAahs5ZodxG2LvGC+QKBhVNPWxLOu8Mfzd+LW3+qOTM38iD6tIHExfTjDWJ5MvXWdRsvMh29ryybsLv6FrFUoybFoAAjZt8fGJQkqxy3jekox1cLpRYSLupegQwl1TAm8JXo9eRkiqMGVCw9OSpvQ564BFaP9DrwnDMPWbYWBnDevY2J5+PnWeNWqw8wxMpvER2c4meJAP0eyPdCnOLw5uYk7UC0iisK+I+ts+Rq++gMcSupsNg+fHdYR3Bw15C5/6M7B3Is/sA/ENIpsHSL1IbHtV++Ne9LqlPA4IJUR27qKW/IXAJ/MYyC19gRlNZgokvb5W4Zc5CT7rBO+9FtA/3iZyu4PHdzJY8Eq68iDB8ub6I/rCNwsFyburZt9j8QURkCUFUYsp/6OoI1TjjkuHT1B0GwVDFtlvPZR1YuAbLHAV0lwBr2C9wcJ8oQycGhdbC29OtZG2JljImuBDZcBFNqgxtsYrKtQEltjGXyz7RhcHg=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(7416014)(376014)(35042699022)(1800799024)(36860700016)(23010399003)(10067099003)(3023799007)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tGWmgX517Ir+803kE0NU7u4zsoZKE06XwHm8FODXGCyGFmqBP4DSBTYfVEIY4rdBI2x+1+zvRKKvTYguON8XVrZGyoBndrzLGdYVU9iZLCrbZcrVnq7xJAq2GU9adlYvvmOCOl+XE0nJkYKA1PKWSQc4fYg9QC8YwTjbmFyfGGoeL9Ci5/ggNvZrOkn2Xb1DsHQx3YpMx22Y3Q+t5dKg+g2jz5bV9GM2y/mW6qUF+LhzL+hyi486ITX4N8rJVIJrrdnUB7yxCk5TnPQdUTeA9so9rS872PrY4hurT5dCaVuhpGrQzJuGwIOsoxjk1G+iD9RFYxkgPDilbcevgdznSgBVoEoIryEU0dIylk2nq9dOlG7Hvj6TGXvo4z/GfJ8F2mYWLWCdylmHXRnaDmM5BNY+dIWsUEGQeyaHXZoX9Pi0Xa3BJlR7UWwJxVjvCWH9
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:13.0255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e39553-bb04-4324-5295-08df1d86b64e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000009C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11627

Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
SoM [1].

The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
featuring:
- 2x USB-2.0 Type-A connector
- 1x 1Gbps RJ45 Ethernet
- micro-HDMI connector
- microSD connector
- mini-PCI-E connector with SIM slot supporting USB-2.0 interface
- MIPI-CSI Camera Connector (not described without specific camera)
- RTC with backup battery

The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].

While the variant being supported here is named "Ripple", shared include
files are still named according to the full board for consistency with
schematics, silk screen labels and other SoMs on same board.

Description for microSD is shared with HummingBoard IIoT.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   5 +
 .../renesas/r9a07g044l2-hummingboard-ripple.dts    |  18 +++
 .../renesas/rzg2l-hummingboard-pulse-common.dtsi   | 116 ++++++++++++++++++++
 .../rzg2l-hummingboard-pulse-micro-hdmi.dtsi       |  79 +++++++++++++
 .../dts/renesas/rzg2l-hummingboard-ripple.dtsi     | 122 +++++++++++++++++++++
 5 files changed, 340 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 0bc2bbff9370f..077e8ebea0cff 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -197,6 +197,11 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-a.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-b.dtbo
 r9a07g044l2-hummingboard-iiot-rs485-b-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-b.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-ripple.dtb
+r9a07g044l2-hummingboard-ripple-emmc-dtbs := r9a07g044l2-hummingboard-ripple.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-ripple-emmc.dtb
+r9a07g044l2-hummingboard-ripple-microsd-dtbs := r9a07g044l2-hummingboard-ripple.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-ripple-microsd.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-remi-pi.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..95a36f8804b55
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-pulse-common.dtsi"
+#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
+#include "rzg2l-hummingboard-ripple.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2l-hummingboard-ripple", "solidrun,rzg2l-sr-som",
+		     "renesas,r9a07g044l2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2L HummingBoard Ripple";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi
new file mode 100644
index 0000000000000..3fd49333ff195
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &pmic;
+	};
+
+	v_1_2: regulator-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-max-microvolt = <1200000>;
+		regulator-min-microvolt = <1200000>;
+		vin-supply = <&reg_pmic_buck4>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmc";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		startup-delay-us = <250>;
+		vin-supply = <&reg_pmic_buck4>;
+	};
+
+	vmpcie: regulator-mpcie {
+		/* supplies mpcie and m2 connectors */
+		regulator-name = "vmpcie";
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		enable-active-high;
+	};
+};
+
+&ehci1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		vdd2-supply = <&reg_pmic_buck4>;
+		vdd-supply = <&v_1_2>;
+	};
+};
+
+&i2c0 {
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&ohci0 {
+	dr_mode = "host";
+};
+
+&ohci1 {
+	dr_mode = "host";
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_ORANGE>;
+			default-state = "keep";
+			function = LED_FUNCTION_LAN;
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "keep";
+			function = LED_FUNCTION_LAN;
+		};
+	};
+};
+
+/* mikrobus uart */
+&scif1 {
+	pinctrl-0 = <&mikro_uart_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* mikrobus spi */
+&spi1 {
+	num-cs = <1>;
+	pinctrl-0 = <&spi1_pins>, <&spi1_cs_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_vbus_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi
new file mode 100644
index 0000000000000..80e43510142ab
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/ {
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	vmipi: regulator-mipi-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vmipi";
+		regulator-always-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		vin-supply = <&reg_pmic_buck4>;
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		port@1 {
+			mipi_dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_from_dsim>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c0 {
+	hdmi: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		a2vdd-supply = <&vmipi>;
+		avdd-supply = <&vmipi>;
+		dvdd-supply = <&vmipi>;
+		pvdd-supply = <&vmipi>;
+		v3p3-supply = <&reg_pmic_buck4>;
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
new file mode 100644
index 0000000000000..aeb92630f4c6b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/ {
+	aliases {
+		/* this board does not use second phy / ethernet on SoM */
+		/delete-property/ ethernet1;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
+			label = "D30";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(47, 2) GPIO_ACTIVE_LOW>;
+			label = "D31";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(47, 1) GPIO_ACTIVE_LOW>;
+			label = "D32";
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(48, 2) GPIO_ACTIVE_LOW>;
+			label = "D33";
+		};
+
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(7, 2) GPIO_ACTIVE_LOW>;
+			label = "D34";
+		};
+	};
+
+	rfkill-mpcie {
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&pinctrl RZG2L_GPIO(14, 1) GPIO_ACTIVE_HIGH>;
+		label = "mpcie radio";
+		/*
+		 * The mpcie connector only has USB,
+		 * therefore this rfkill is for cellular radios only.
+		 */
+		radio-type = "wwan";
+		compatible = "rfkill-gpio";
+	};
+};
+
+&eth1 {
+	/* this board does not use second phy / ethernet on SoM */
+	status = "disabled";
+};
+
+&gpt {
+	/* mikrobus header pwm pin is pwm channel 6 */
+	pinctrl-0 = <&mikro_pwm_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&hdmi {
+	interrupts-extended = <&pinctrl RZG2L_GPIO(9, 1) IRQ_TYPE_EDGE_FALLING>;
+	pd-gpios = <&pinctrl RZG2L_GPIO(3, 0) GPIO_ACTIVE_LOW>;
+};
+
+&hub_2_0 {
+	reset-gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_LOW>;
+};
+
+&pinctrl {
+	mpcie_rst_hog: mpcie-reset-hog {
+		gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		line-name = "mpcie-reset";
+		output-low;
+	};
+
+	mikro_pwm_pins: pinctrl-mikro-pwm-grp {
+		pinmux = <RZG2L_PORT_PINMUX(41, 0, 4)>; /* GTIOC3A */
+	};
+
+	mikro_uart_pins: pinctrl-mikro-uart-grp {
+		pinmux = <RZG2L_PORT_PINMUX(40, 1, 1)>, /* SCIF1_RXD */
+			 <RZG2L_PORT_PINMUX(40, 0, 1)>; /* SCIF1_TXD */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+
+	usb1_vbus_pins: usb1-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>; /* USB1_VBUSEN */
+	};
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_vbus_pins>;
+	pinctrl-names = "default";
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(4, 1) GPIO_ACTIVE_LOW>;
+};
+
+&vmpcie {
+	gpios = <&pinctrl RZG2L_GPIO(17, 0) GPIO_ACTIVE_HIGH>;
+};

-- 
2.51.0

