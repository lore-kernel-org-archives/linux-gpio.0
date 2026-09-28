Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021131.outbound.protection.outlook.com [52.101.70.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D34EDCD8;
	Mon, 28 Sep 2026 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.131
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616866; cv=fail; b=RGHWZhHX2Xe1MHdiau+N4cBS/qy3lkxoqpWs2+2kgI/0fwLECm7r5x3yImOH3N4R5846IMZ4iwiudO2dm30lhc/PNUWPAk/fRLN1d4Lm/xQbAoNBm6LjBawnjEFWqobm4BYsZzPSagOOWQiQYcyQGWvST2fUch8OZzwmvsQZrzo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616866; c=relaxed/simple;
	bh=DbAYcbvbhbo3GiLPgZRbQUmu+hx3IzJXAGHnC6by7ek=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eEyBtmXEBp4SSUQPR9TmkCJbN4YTvpjwNXKOoxJ/pwMh+LbvS7GDO13vipHaIgIdg68RJqUJBdTqQs68xR7Pgpkj+C+UwjBbtv9eQ4J9Tbtx2lDj3AODC/nhY1hrfU/+tDF1eahrsNkCz12W+Oje/pMayDpsioFoUQiqU6FwQn8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=UqDuzwUd; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=UqDuzwUd; arc=fail smtp.client-ip=52.101.70.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="UqDuzwUd";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="UqDuzwUd"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nl2nycddAd5/RJpLdd+NoYAnX658HC4SkjoL231KjWY/2buAQ8cMqJCfgfbV0eIyqhieIGThEZnEYkIgOscSaJINhmNafOQ0R0ZL2p23XkyJ3NFI5vbZ20Q7hyLvfuT1hcOZ2r9pcilDU4jeGN9NrWpo74paoQyVy5OeZns8sGVIK6KxhPzROJ35+xiXa5a5DwvfyHHAxdlfalrnG0rc0IZT9MuvZunljuY8h8af7eD6YIO/OwVgArorQm1NLCadU4Kk5N7UM/3Gy/YDGGlc32fKotktwqo678jX8NJtJxgXtFr3t9G6oRBfC2USfyRrNtjrlZe+SbOgJykre0DgPA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=KbBJszYV9QA44ZewKPf4yvqDDOilIgunLDiYa7yrcUU3ctS85k/ACi9kJCPBV/6JWPn0rFXNKzkFjDpfSfhNpV5HkJZqCA1sSAFwDh7EDY02oLhZOSrQ3QmRv+9LlRjZBtV6egLiVG10pTk2p5p/pPJVXBSSegnmjgTgd23GxZ0aASzkRlOX69Ncdx1SRibFNSPsfpBsKfRRTRmCHAeKLQCJJv+JHt2X4NYaZNA4NCLrvMT+6WVdTcIo1eG3y8cESxty27ysxYPaQQC3xVShwDlN/RCGA1a/aI5/Rj/vWKmIPp1rjLgeRfPTJ0FVbwg1KxFOTg4zuClt3kxt0DdzPA==
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
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=UqDuzwUduHumaRceUaR1b9qrUX7paOD0ZHo3gPNDdJ/cXM0rCTvOIcU9SEMtteJrOdUk6x+EC076kFNsTYlHx6JXn3RJ/t8AEzaut/0c7+lRpgFe3xosmN5PXQXA7g3v2Pyqf9ZQbdfHIoZrtA2JP60g9WmBAZ+F2T6u6EXTbT7Lpsdt/bxuHzoW6AGoYs+J7kHmxZBbqzL6t8bYtEbyPncy0q1aIQFNg5perEYWWF+jyeSVZqvFbxhyl410SDC0+1H+kuKJ05lwZ7ZaKyw6leBE5VNbjdI4s8HvTn0DYMZtAc2hGwlKzE9o/VsCzD4WlNYRRbX6lyuVMUvxtACFww==
Received: from AM0P190CA0004.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::14)
 by VI1PR04MB6847.eurprd04.prod.outlook.com (2603:10a6:803:134::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:34:16 +0000
Received: from CPH1EPF0000052D.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::3f) by AM0P190CA0004.outlook.office365.com
 (2603:10a6:208:190::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:34:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 CPH1EPF0000052D.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 17:34:16 +0000
Received: from emails-2570297-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id DCF20805B8;
	Mon, 28 Sep 2026 17:34:15 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616855;
 b=DmQRl19er/BNdORatext7fhTSU/RVP9f4cbwYyEuAD9kvjVuLtIet4MVYAid5uYapXo23
 MHyEQIaVqhsS53YlDltZQWRCIkUHzwwIf501M/cqRDV6ibgsxscFKC6EfhyjSgWubBvWTyU
 BiQWDkl7IcqqWQClv7ngaqRH9AqSY1M=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616855; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=WdMnek0+3boTcnHLTCUNSZLjxM7QkfK8KDMVqG12iwU3UW+7NUftJoSLFZeNTEBn8LSmX
 q11cm5+JSYaM4jWjByUgPAN4I/RpM119PZst7KJFcWNXmZIrHzicvoDpMLz23Ap8A0OS0Xy
 coU7EYdJ+lVnyoRIHkdmO+idJBNJs6c=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=UqDuzwUduHumaRceUaR1b9qrUX7paOD0ZHo3gPNDdJ/cXM0rCTvOIcU9SEMtteJrOdUk6x+EC076kFNsTYlHx6JXn3RJ/t8AEzaut/0c7+lRpgFe3xosmN5PXQXA7g3v2Pyqf9ZQbdfHIoZrtA2JP60g9WmBAZ+F2T6u6EXTbT7Lpsdt/bxuHzoW6AGoYs+J7kHmxZBbqzL6t8bYtEbyPncy0q1aIQFNg5perEYWWF+jyeSVZqvFbxhyl410SDC0+1H+kuKJ05lwZ7ZaKyw6leBE5VNbjdI4s8HvTn0DYMZtAc2hGwlKzE9o/VsCzD4WlNYRRbX6lyuVMUvxtACFww==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GV1PR04MB9200.eurprd04.prod.outlook.com (2603:10a6:150:2b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 17:33:59 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:33:59 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 19:33:54 +0200
Subject: [PATCH v10 03/11] dt-bindings: usb: cypress,hx3: make peer-hub
 property optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v10-3-91752ea39cbc@solid-run.com>
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
 linux-gpio@vger.kernel.org, Josua Mayer <josua@solid-run.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
	MMZPR04MB400504:EE_|GV1PR04MB9200:EE_|CPH1EPF0000052D:EE_|VI1PR04MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: d84d7f41-ab51-4b79-f320-08df1d86b848
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|23010399003|10070799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 sm62IuJwdeHjwv2EHRODzvtlrjQreYdNAXUs/q/KrFbUO9XG3/nCG8UIBXUQf3jjka3forCxGqtoquyokKEzv0iDAL3kKhXHZBzdwrJE/m+J5yTt1zGGkVaRpgUR9yUd6iFb4lq6r4vQBemZyLq0lqXhmTugmdeKVofDtSXas6+47+5LFTZ5Ol7YYrgTknRG0qB7gjAwFrCSf0dzMnzdZSkq975qHfJM7tuR63LVgpTxSygFEinvaKO+VW17FNS1r5pNxW17jfV6EjxZlRJVSWON5idt7x8A8WqyWAd6y/jCTMIyjANaES1hbNi+WK3lkOwlD2V5gDVBHO817rZnLseaxbDhZag37BxH3sr9eCrpxOoHK5N6UA55RRoHq5QYzP/9zU+qZIeOOXnvLRNTrL84GbxbxK1w314jg+NcxsSRV2HLpxakx19KQ10kg5xxVOMNjJrtUhE0HdXnhMTiD2BZn3qsrE5RYefszyoohWFJlRp2dFNCIeXm0jgO3urxylDMQhOAUPJkim/3RgHitj9kGFI3VPmPBLQgOWX+ew4tl3GmfrEW5tZSNGk7hwwjHcxoEeO96uUH1rof8dO3fqhiOvyWD3OYXijIviX2iIV3dGTts+jOrcrvQTNMWlXJtLzg8pAr2T5bgAQu25RiuQ2GPciBzexuHeWJmpR4AWY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(23010399003)(10070799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 4AAmq9z/TsLZfRTdV+dykoZWzQXR+zf8ySGT5UGFIjRe2+5hZsUN9pPeXFVHyEUEiUMTZSuL6nQDqfLQXFrF/MRTN+DPLH4vd1V4r2HD1Ki2ZGcgWnOWy7DKxx+WdQ9mLWloG5v3HKZHcpvPRo9i6zrBuXbw1DCoKEqQf2H66TWdMF7Fqi+5PvAhYz0t+HSY0/oEjifVPVq8SMdIPDXqC3k4vgBNfxfR6vr/EA/yGxuInb+gVR5RY0MKIn65p6/RdSKRMz6LNSc9ETNqj3dX5hvVHorCzEMIVykDy3OtIL791caU2DDoJMrqXEj3NweqwFU0LsgsVqNCCZ784Atskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 34863b088c314033acb4a90fd024e7e1:solidrun,office365_emails,sent,inline:443b033dc8c256d8380681a078a730ce
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKigFHh7QeUVTGPeozfOMqnKiTZ9JW4K4YwQNGBh3tgTwxC8LhsILza1VXhIHJ2wS8lM6HIG9MViTCvv1bcGImkaIykDBOLNT2DqIeenA7e1xeL0xCDfZWFdKYr5bIfIYVLR3NB4huv5I4HN/hBJ+olnCBdDplLxEnb1vCBILY5XrKGJ26Hu64TF1dXcj0ZDc+2CvOWMdWwESgymfDcV9pRb86Dg+GsL0rm4up3yu9FdhHM5G5+kjzfe7ZGcxfc2e6U/TI5PuVVzN0JQjxqY2UWVq8EwVu4iO7PJsz8DK1UEyL4f1KNcxbysAosT5GvsvthF1rtzK0cK1EMyA2FQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=JwBKweg9QKP8w1gfKvpz/TpYd656C63Ltt5aguAXvBoho1EIDjrpvaN/yEYhtseuZvjVMaqqTjn03vxPP5oDpL7sqJ453TEw0q3R8TJ7650tccmvR21ht05Yv8cy4q8kwyBulRcgYRb3SAg+YyWGJSahM3+v6Ygowrzn+a6n+iwXXa1T1zuOPX7d4rn28QPR8eASO22In79hgTNYNM5MlREJX5W3YeJHABx1BBqHj/ftJOCiil1Qu7Sl3ZdHcNGmJnMBQXXled88OzylZ5p88LuTxe7Uz6SBotv1cf83bgmRok98vz07fwSVXWPHjkLdaX1rRgyr3UqaIVRf9vQ5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c745d0d-0f8a-4d9c-365e-08df1d86ad25
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|14060799003|82310400026|35042699022|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y6Zc4NVGJzkFP3KjMLuomFHdBwTa4avDUGUCZ26Wreeg9bc43lo0t+fn8NfaXWgxMVkT+Kp9b4U+3+Zv4bOxYF13I8tfiM8KJx7ALY1ab86DNuPnvp1AcY662UJwEb0rSKuGl9b8Q3R6fs3+hSwD+X7OcxctNnhwaswHhE7SDHi5AcumD2Y5bLyQvXpftZMxnW1ep4SLmpPLT1kcGJpEC3LzigwMVIHnRQ2Y+XY3y+4n1u3C0OQNHcP9Cyt5JHHrf0rkyd+wiNc86EiwyJ/7Lu6tkX9E5Enr5moSluarFP3oS4qq9qy4AJCkE3EBAacffgKpHG6IdP4Mw2VXMTSrfkqyVypZlbe+cSldufS1YEiDb/UuWuNxgKTIKoSBEOY7EJ8b9QW1bKP5vXhm/tQHfck/p4oC5WVqy8Bn4GRYtYKxJw5GNu247/otOeYnsrANdB0E7GiepeBLCIT/v0bW1bGxpf02PnYfWQYJ+Oqw551nQygSeiUpy2bb7sw83zSsgCGty4LVWbyQupKG+WHhmj7vOX6a4ueKc703N5W9paIz8wcpX5b0xo9ZWfztfZHlZL9fDJnFHwHpPoiZ8Wp8VAZvyu7swoB62u7HkkO6aIK/samOcOyd0/PD4XZKHb6MIjovh3jIyf+Bkg4OHS3oyG6/MfoLDAWLh91Hmm6fKP9Hm5b86a00LVPS+JY9Q8LIOdf7ShrFBeeFJK/914aQsQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(14060799003)(82310400026)(35042699022)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	70bQdYNdH/fHqVFLcxmEueiHeB6HkKSmC946FaNstOydyZtUepjxXA/EfUhLNtAkpsKQ2UAIs5dVt2o2qzDXhH7Ha5H0rwG7NxKokF+a2aBd5URoasbkpZ1rndQOIQuAOIwkmGkCoJ4KcbyeOARj5pds2aH32P3EkbU/EKk6NnYZ/IKltcbrELigY0SyF2FrPsHaFO1gkkw33Ly+IsdGm3X8tBuBdtFXuF0DjiJZX2NIbaMKfU+wbtv2kdOCpYLEli4BYqXa1FMR8n1K6W0eDrEv1M/7N3xOsCT19HkSSSxKO2pgSfwfIuGAeORx33AN42OIbQ9QL2sR06ExfI9QhyVbVFd+/sTAvuRlB5ohHffpoJ6ttl6kfVeD4KYv7pMoxDYWwABgjn7GK00WoKQY1qMkzUK9q4z0f9MMLdhJ3xgQT6A6LYkMs6YLbkKEoNpU
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:16.2961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d84d7f41-ab51-4b79-f320-08df1d86b848
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6847

Cypress HX3 Hubs are combined USB-2.0 and USB-3.0 devices, and should be
described by one node per speed and linked by peer-hub property.

It is however possible to install this Hub to a USB-2.0-only host, in
which case the USB-3.0 peer has no place in device-tree.

Remove peer-hub from required properties.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index d6eac1213228d..aca2fe796240f 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -53,7 +53,6 @@ properties:
 required:
   - compatible
   - reg
-  - peer-hub
   - vdd-supply
   - vdd2-supply
 

-- 
2.51.0

