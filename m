Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023136.outbound.protection.outlook.com [52.101.72.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF8A4E2349;
	Mon, 28 Sep 2026 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.136
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606448; cv=fail; b=czAOcv8Mo5wJ6bdLlE1RhDVFw8gRznpZNpKD3f+i+WXPcI4jjmEVoVgYF0LyTWB1/H5ZnJ2axxm69lYZXIDxjJMi8sQAPe1/6wfnI95nZGVF/aq5LlKkEsPSSJSB5NKVWIJChWCKqYLg4pSKZ/55mqflbh1l9UYEwtqc2mdclfU=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606448; c=relaxed/simple;
	bh=hxKSCcdk+HmUikcs+BGHbyJBV1CRhhQsnFAOiCnbpeQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QUPb8n+CZZkd1LUEAcmJ+DNCo1f0LNsUpOSMC3rGWtVC36+DF7VzQAZjPcn10aW6idny5EFnceUw9rKXtuO51tU001bDVp9ibvCmFKruY+x+Uc8x0n+k5cR1yrXKU6RphGtDkaLazi+j5ut5I4jtV2exoI/cB2AC31fwohE6MG4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=dGEe3Orc; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=dGEe3Orc; arc=fail smtp.client-ip=52.101.72.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="dGEe3Orc";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="dGEe3Orc"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v3hcEHNJjoqeekiYvTrMOBWtxBW9az2EobQROmcL+S7ZqfsuB5KQwFdtdhCcYCAZKfex1l1A5X3Vi2Yt+w4A67EiXEw6jAiPCF2bXjf9kOmjyDobLoPqet4MPkKrt+eoDlWbhZWnyhyxoOMgf0upXmn86YTA6GEtAp9rLu4wT3ktpBtkgXeQxJxjPNfmrUy3BLTvXdKCFhsbcFjx8sncHCFj7JMM+EOl4NO+ndyOqfnr3i4CTa003+Il6pPc36JQGC35OUiOCp7SjOphl9R+0mfyaNFokMiUalGczjlMXM8HFHK0ttXF5ZgQaHJfu7/iaLff1f4KHNIPhfvwFGQh0g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKGoRtBxbyrjgk6p0kgpiyn4xNF36lhUo2JyinkdhLA=;
 b=OJjjg8CiMdd1BJvsukukgZIDv9LajfQJLnQf1xDJzPCMsBQ+cqdgSZrfcRZmkRQNZmMqXKPOyhD19NL9BlmZEr1CSQunVt/VHX94Hjj0NwzuPkkvoJGRYyxDvqAFvtUn+jt2UrPcP+VBIgt/g8e9TIYsQo4iW5vlBcHywdhCl6SypsLyFK62zVLa3ebHb+PJcfsMpvabOQYPolNbHCbpxJeeph2L5/E3IsLeqi/6x9qw2zefyddhOoHazBTG0YfDvg/TN5P4CugA4iQUMHdRuCFzcRrE5I+RVzdi4UnXbpaYTveBfvHNMZRnc+Mfds5iUipudaJsLG4EiRwgT4hz+w==
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
 bh=dKGoRtBxbyrjgk6p0kgpiyn4xNF36lhUo2JyinkdhLA=;
 b=dGEe3OrcjOFVFffUWaK+O6p+cm1FnMVrIZnvu5egliLHf8UDw3yymFLxh+fMcBgJMeqBdfxVor1H2Tlr8gAvHHCTgbGBAE//8clhHukF+9zrNp8QeMdbeMOFSaMW7IMSuhubl3gNrWsQ6jVT/NFbx7jCn6j0A1SKa3pz9I2hVMNbNH2v08ZFne/2xqdngKdVlcG2iZQGJHa7Nm9UaIlzLFgjLD7aIsckUqA5Y+lJ9HtVmqacer5t0C7fjfV3qDTXmEPhtsfR4K7Kbi6zxhrP/UIfN8/8CTKa6y92n6OAP1Ay7u/BMsyjSvq29eZdOZEZZYyISCja1cWaJ0ouWO463g==
Received: from AM8P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::27)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:40:13 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:20b:219:cafe::94) by AM8P190CA0022.outlook.office365.com
 (2603:10a6:20b:219::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 14:40:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:40:13 +0000
Received: from emails-6101725-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6404480513;
	Mon, 28 Sep 2026 14:40:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606413;
 b=nTYen+5+9pfRPin8E1uWZoVHER8D7bPLHmmACZzqxF43OC7hQOLg3OHOU0dc89osTyYMs
 smJyPq/ypAn4kx7RTh8W03/+yuIiipKtib8/GNfmOF4rDX/+CEDv6jcy2T7OXSUzPPlMJyz
 dX7WJUB0axicJJMVWedPxw7zLkXP/WE=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606413; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=dKGoRtBxbyrjgk6p0kgpiyn4xNF36lhUo2JyinkdhLA=;
 b=o4O67fzpW5cd8v0+5wLGnD9k1IeObpcnqcDzohPl/5OvT4NgL9ziD3v1WbMibAwJscoaQ
 2edxPHvLbE4eIlKGxEcPPEsNpBKpakRy0OxnJwNDvuuyzQNqn1KIxHD2gJ/8wafMOih0NwI
 mftIb7XptHTSL1tyyxwBP9+C52Hpz8U=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKGoRtBxbyrjgk6p0kgpiyn4xNF36lhUo2JyinkdhLA=;
 b=dGEe3OrcjOFVFffUWaK+O6p+cm1FnMVrIZnvu5egliLHf8UDw3yymFLxh+fMcBgJMeqBdfxVor1H2Tlr8gAvHHCTgbGBAE//8clhHukF+9zrNp8QeMdbeMOFSaMW7IMSuhubl3gNrWsQ6jVT/NFbx7jCn6j0A1SKa3pz9I2hVMNbNH2v08ZFne/2xqdngKdVlcG2iZQGJHa7Nm9UaIlzLFgjLD7aIsckUqA5Y+lJ9HtVmqacer5t0C7fjfV3qDTXmEPhtsfR4K7Kbi6zxhrP/UIfN8/8CTKa6y92n6OAP1Ay7u/BMsyjSvq29eZdOZEZZYyISCja1cWaJ0ouWO463g==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:39:55 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:55 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 16:39:39 +0200
Subject: [PATCH v9 11/11] arm64: dts: renesas: add support for solidrun
 rzg2ul som on hb-ripple
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v9-11-5901e0fc9e44@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|AM2PEPF00070CF7:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 2511bfc2-051b-4354-b973-08df1d6e67f2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|3023799007|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 VgakvxNHXEf9v2e5Grx/9uZSRHsHjosV8BJofmoCWF8XaUODHqveLaR694888FSnNb+YFx/J5JZg+boD3x6Zl/Y7RolBXwODndxumPc5E7uyRbwGJdN4j2i31z9w8c8ku/ofkhhK6HxGlbLoshnqlT/grY3CaBJmiqpszd759d4MkZ+BFu84wrQIXzOm2TmG80GoEdxTk3IFsQSo70CRnNScXXdA0FJNutX8qNGcXV0Xixv5z4V9mNHWThqyfSHcbhOhKfpjQE6j4YVvWiIGdNAXn2WoJV4zFPzT+ks1LBwTcU7zOCJ3LXO2eOPPxMbbAC65D1fpYCKFlZnb3g0kr0ptjrrLDFW3JFWhT0NtUZ+TXF8NJtS0nQ48Vnb6qGOdQxKqsoLLMkpYM+BUEJecQOtcXmSlyHhvLfTKdAivnAyF6xtoXd5q9Pxf73tZPQAlVKirRKSWhcMGN/VoBCokv1Hvt+gvFQ+pOP3FgdPBm8o/DNZTJ0b0lgoAqKhAyJWeSFo4RGgYm0lc4ExWJqcqxGup4JEHUbdnle2oS23e8lqdfmNtgsZXR9D+vWBrZx56rN8TPyBy86dXtY27o7R0ZfNzbs1gEVt8dH7eQXj1UjM3JA19GPgOQah0gay8jt6o
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(3023799007)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 f+csSbwSzswwZ/oHUBYYkPYqUnaS+VGCTjCilPSDskaMzRtxFN2PtL90nCL9d/K0HeyICWyyUUU9NyqLC6MFSK1Eqk3HFvylJBcYXFiwwInkJYG3bnPTokx9y0qiH6oA/Qtl8loxApMvHW4Idub8YAMM0CPORdzwqqdGYFudiaoKDzE41Ez8E3s+gJgMnjlENf2vGjazCZdnDLcrNOgVorCdn/SnzalLQboWcurUTfTw8TC+Zmo3s3sWgz1hMLQ0Ro19pNJhTdAAJiDFYpXFw9XDMsicgYNyJumt0u7P0Nd19askRCi4qFWGEJSwEzHD694dZc1AinjpdgiZjELkRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ede8a43be1504b65b8da6f860dd2cece:solidrun,office365_emails,sent,inline:ccac836d61caefcbefa3c2641c859a8b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qT9gEgoMJkJIM7/AMNKNozax15cTASKo15knTzFUrsShKA+FpFnbaE8xf7qFm/NQJhIUyUgmcg9I7BSyynrSLZYdlcANkDHcUYr+wx4oVKVTP2FbP9ia0cVmZPVwXUtHbTaKJYwh4VB/WQ1MgJcjKQRSE4ZzuNfYKf5QkpVTZv31pTEe/T9WcBWDbr8nN7FezhHH8ky0cEI0kcBlmJoFHOpz8Mp2Ud64LnTOowCqnTglGNG4YY4zPUClH1GyI8jkAx9lGAtmkZfngh5fq31g+eTZmRiYIuJbxq/+ZHlDu8LeQ4i/SeMFHgQHXK1TauoXrzvzU/fkOkt1BHzJLUhBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKGoRtBxbyrjgk6p0kgpiyn4xNF36lhUo2JyinkdhLA=;
 b=ut/SnlT4RSS6Zh95ehiVKKf4w6Ne0svcc3dzLEsUhENJpqUdnl/zeguYb0U1zCefq4WmFqnGsuLs+H134Qg4aphWbXQcuDyDhnvkgAMD3+bp+tAbOO5ybep7AHDDFFL/71BGmvWPzVJfDu/oPXyCJqhtBBbka3VhVi6oyOu/9YASVyorgC2LPNZmAbjnNYv13IiBnONeEaEWz/IlZHwQy0ed4iLsszEtN5Tk/1bRQgX5DIdnVJRYVQnUdWTDOZUN4aAIkBGbg2kXbHBG1FLanwWhJ6De6da6CdFs7WVS6BbCEIDMtx+jmZQuks1Xu00SmKAFOyYYBw40wfap0mN2vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	800c18a3-561e-473b-1f92-08df1d6e5d2a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700016|23010399003|376014|7416014|1800799024|35042699022|10067099003|3023799007|6133799003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	IHSxAQ/+MTPdBQrF0e3lim4qiFS4cgxY6K1uai5g7tyedQCgjXxA2ROA/DE4kEoVuJ5EUe8PJwE1v2sGIvgfkkH5UZbw+bqusxQ70zzYPjiZ4FtK7BDObIUpbwvD3ISzAPOlMtkGYSkWhSQh7hmy32f7T7yS9IQcyjok8ZQzneYkoMr6/dYpXSaLLepAChMT5rvYZBzl0LvemZAzLQo5JMh+h+56m9Xb3obYfDNpa0Akoz8i6P8PQ3IcmP6QvrwR6gHH0Zi4kEi/6pI20q0U0VFvgRntuAXiUgklRpKtn2c4Fe84/rQtIwdCr31MyPK1OgJqUUXfch/PJm9yL9nWufvvUfpPta5kA6M3WuQjJ/35bmpOrO+BOvgXi4hdrm28oPF4Gi/d7isIfcR9m8+T3SpR6ZqnkbcfDgwZSGpPmZE3KwyM9tWjEafKcYrbVVH5Cf6yUwKPUBPtJzyziQ+2vKkNZLTQBalWevaNB9iDOnTs09K++N7JYTwao6pDsEUb2h6VfOHVug2sLDVLe2GwZ0s25GC/7pbEyWj4oYXmyRrgPDt/zMfkgunmp+mV0lmwcUqYwXxX7Wqw7On2BSfv8zdm3J7mpCkQ02KmlDAaXD/fP2D0dV/7VQ82Q/aciEhYHZvlloh59YVzSsIbv1j8vg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(35042699022)(10067099003)(3023799007)(6133799003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZHV6mFuRR/Pr/odEpS4XNlKc5zruAC0A/Q5R8uLBDy2hmpgyxqJR4Kcyio1oxmT+30DU4Zu40jiuUeol53FxuZuNRQghVhk1HvevakNq6BbnafRjTncUPUWWwMHycKqzwtCVbe31axloi7shZpDnFFD1QJo0bGsP5n9K9hCqEyaao1r/aaBGWM37LxJ3gj/tE9TNLwNoQKXGlmF4LtvT4W9aauFTdacq/IHaoVW2PHfSlIZo6FFhigGXXnUDB8VGkKOPcEC3ReSWYNwV3Z69YtMONB1lLel5/dfUZWWmBa913zw/uPX+FaRFWi2Tjxf+oJgdS6fE5iwW8U3te0MerPoiVGIxhZ7dHLWctlmpGyD1gEb4lAoNbYig4DrfwJ4now2LDozZ/clD+ZBkCcphl+d851iDQDhLiTSqvWayaU7ycUEYnD4LJ3KmIRW1Pmz7
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:13.6460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2511bfc2-051b-4354-b973-08df1d6e67f2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113

Add support for the SolidRun RZ/G2UL SoM [1] on HummingBoard Ripple [2].

The SoM features:
- 100Mbps Ethernet with PHY
- eMMC
- 512MB/1GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
featuring:
- 2x USB-2.0 Type-A connector
- 1x 100Mbps RJ45 Ethernet
- micro-HDMI connector (not usable with RZ/G2UL SoM)
- microSD connector
- mini-PCI-E connector with SIM slot supporting USB-2.0 interface
- MIPI-CSI Camera Connector (not described without specific camera)
- RTC with backup battery

The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].

RZ/G2UL SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
board. Provide dt overlay changing pin function from uart to gpio led
control.

While the variant being supported here is named "Ripple", the overlay
still carries the "pulse" suffix as it would fit all its variants.

Descriptions for eMMC and microSD are shared with G2L SoM and
HummingBoard IIoT.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  10 +
 .../renesas/r9a07g043u12-hummingboard-ripple.dts   |  89 +++++
 .../renesas/rzg2ul-hummingboard-pulse-leds.dtso    |  48 +++
 arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi     | 437 +++++++++++++++++++++
 4 files changed, 584 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 83519d459ae80..2b6c7f63c44cd 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -164,6 +164,16 @@ r9a07g043u11-smarc-du-adv7513-dtbs := r9a07g043u11-smarc.dtb r9a07g043u11-smarc-
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u12-hummingboard-ripple.dtb
+dtb-$(CONFIG_ARCH_R9A07G043) += rzg2l-sr-som-emmc.dtbo
+r9a07g043u12-hummingboard-ripple-emmc-dtbs := r9a07g043u12-hummingboard-ripple.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u12-hummingboard-ripple-emmc.dtb
+dtb-$(CONFIG_ARCH_R9A07G043) += rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G043) += rzg2ul-hummingboard-pulse-leds.dtbo
+r9a07g043u12-hummingboard-ripple-leds-dtbs := r9a07g043u12-hummingboard-ripple.dtb rzg2ul-hummingboard-pulse-leds.dtbo
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u12-hummingboard-ripple-leds.dtb
+r9a07g043u12-hummingboard-ripple-microsd-dtbs := r9a07g043u12-hummingboard-ripple.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u12-hummingboard-ripple-microsd.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot.dtb
 r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple.dts b/arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..8ffa51dab56b2
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple.dts
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Description for SolidRun RZ/G2UL Type-2 HummingBoard Ripple.
+ *
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g043u.dtsi"
+#include "rzg2ul-sr-som.dtsi"
+#include "rzg2l-hummingboard-pulse-common.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2ul-hummingboard-ripple", "solidrun,rzg2ul-sr-som",
+		     "renesas,r9a07g043u12", "renesas,r9a07g043";
+	model = "SolidRun RZ/G2UL HummingBoard Ripple";
+
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&pinctrl RZG2L_GPIO(12, 1) GPIO_ACTIVE_LOW>;
+			label = "D30";
+		};
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpios = <&pinctrl RZG2L_GPIO(5, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&hub_2_0 {
+	reset-gpios = <&pinctrl RZG2L_GPIO(13, 3) GPIO_ACTIVE_LOW>;
+};
+
+&pinctrl {
+	hdmi_pd_hog: hdmi-pd-hog {
+		/*
+		 * RZ/G2UL does not have DSI output to feed DSI-to-HDMI
+		 * bridge. Keep its shutdown signal asserted.
+		 */
+		gpio-hog;
+		gpios = <RZG2L_GPIO(14, 2) GPIO_ACTIVE_LOW>;
+		line-name = "hdmi-pd";
+		output-high;
+	};
+
+	mpcie_rst_hog: mpcie-reset-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(0, 3) GPIO_ACTIVE_LOW>;
+		line-name = "mpcie-reset";
+		output-low;
+	};
+
+	mikro_uart_pins: pinctrl-mikro-uart-grp {
+		pinmux = <RZG2L_PORT_PINMUX(14, 1, 1)>, /* SCIF1_RXD */
+			 <RZG2L_PORT_PINMUX(14, 0, 1)>; /* SCIF1_TXD */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(5, 0, 1)>; /* USB0_VBUSEN */
+	};
+};
+
+&usb2_phy1 {
+	vbus-supply = <&vbus1>;
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
+};
+
+&vmpcie {
+	/*
+	 * G2UL SoM v1.2 moved this IO from J7-28 (CON4-12)
+	 * to J7-18 (this regulator).
+	 * There are no known users of CON4-12 and thus no need
+	 * to differentiate here between SoM v1.1 and v1.2.
+	 */
+	gpios = <&pinctrl RZG2L_GPIO(13, 4) GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-hummingboard-pulse-leds.dtso b/arch/arm64/boot/dts/renesas/rzg2ul-hummingboard-pulse-leds.dtso
new file mode 100644
index 0000000000000..ab7f826c6e039
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-hummingboard-pulse-leds.dtso
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Overlay for SolidRun RZ/G2UL HummingBoard Pulse
+ * enabling LEDs D31-34 in exchange for on-SoM Bluetooth.
+ *
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&leds {
+	led-1 {
+		label = "D31";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(5, 4) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+
+	led-2 {
+		label = "D32";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(5, 3) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+
+	led-3 {
+		label = "D33";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(6, 0) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+
+	led-4 {
+		label = "D34";
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pinctrl RZG2L_GPIO(6, 1) GPIO_ACTIVE_LOW>;
+		default-state = "on";
+	};
+};
+
+&scif2 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi
new file mode 100644
index 0000000000000..c629688189270
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2UL Solidrun SOM
+ *
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		rtc0 = &pmic;
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial2 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		/*
+		 * Physical RAM starts at 0x40000000, but Renesas RZ/G2 BSPs
+		 * reserve and hide the first 128MB for TrustZone by default.
+		 *
+		 * Minimum size for this SoM is 512MB, and the bootloader patches
+		 * the dtb according to the actual RAM size and reservations.
+		 */
+		reg = <0x0 0x48000000 0x0 0x18000000>;
+		device_type = "memory";
+	};
+
+	sdhi0_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		/*
+		 * Mux switches SD0_DATA[0-3], SD0_CMD & SD0_CLK between
+		 * on-SoM eMMC and board-to-board connector using one gpio:
+		 * High = connector, Low = eMMC.
+		 * Define active-high for logical mux state 0 = eMMC, 1 = connector.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(2, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_pmic_buck1: regulator-pmic-buck1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck1";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+	};
+
+	reg_pmic_buck3: regulator-pmic-buck3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_pmic_buck4: regulator-pmic-buck4 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck4";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_pmic_ldo1: regulator-pmic-ldo1 {
+		compatible = "regulator-gpio";
+		regulator-name = "pmic-ldo1";
+		gpios = <&pinctrl RZG2L_GPIO(13, 2) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	reg_pmic_ldo2: regulator-pmic-ldo2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-ldo2";
+		/*
+		 * This ldo can switch mmc host controller io voltage between
+		 * 1.8V and 3.3V by assembly option of pull-up / pull-dow.
+		 * Default assembly is 3.3V.
+		 */
+		regulator-min-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		global_cma: linux,cma@58000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x58000000 0x0 0x10000000>;
+			reusable;
+			linux,cma-default;
+		};
+
+		mmp_reserved: linux,multimedia@68000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x68000000 0x0 0x8000000>;
+			reusable;
+		};
+	};
+
+	sdhi1_pwrseq: sdhi1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pinctrl RZG2L_GPIO(2, 2) GPIO_ACTIVE_LOW>;
+	};
+
+	/* 32.768kHz crystal */
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&phy0>;
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2(UL/L/C),
+	 * instead delays are added by the ADIN1200 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		/* Level interrupts are typical for phy but not supported on rz/g2l gpios. */
+		interrupts-extended = <&pinctrl RZG2L_GPIO(4, 2) IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x2>;
+		clock-names = "xin";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(4, 5, 1)>, /* ET0_LINKSTA */
+			 <RZG2L_PORT_PINMUX(4, 3, 1)>, /* ET0_MDC */
+			 <RZG2L_PORT_PINMUX(4, 4, 1)>, /* ET0_MDIO */
+			 <RZG2L_PORT_PINMUX(1, 0, 1)>, /* ET0_TXC */
+			 <RZG2L_PORT_PINMUX(1, 1, 1)>, /* ET0_TX_CTL */
+			 <RZG2L_PORT_PINMUX(1, 2, 1)>, /* ET0_TXD0 */
+			 <RZG2L_PORT_PINMUX(1, 3, 1)>, /* ET0_TXD1 */
+			 <RZG2L_PORT_PINMUX(1, 4, 1)>, /* ET0_TXD2 */
+			 <RZG2L_PORT_PINMUX(2, 0, 1)>, /* ET0_TXD3 */
+			 <RZG2L_PORT_PINMUX(3, 0, 1)>, /* ET0_RXC */
+			 <RZG2L_PORT_PINMUX(3, 1, 1)>, /* ET0_RX_CTL */
+			 <RZG2L_PORT_PINMUX(3, 2, 1)>, /* ET0_RXD0 */
+			 <RZG2L_PORT_PINMUX(3, 3, 1)>, /* ET0_RXD1 */
+			 <RZG2L_PORT_PINMUX(4, 0, 1)>, /* ET0_RXD2 */
+			 <RZG2L_PORT_PINMUX(4, 1, 1)>; /* ET0_RXD3 */
+	};
+
+	i2c0_pins: i2c0 {
+		input-enable;
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+	};
+
+	i2c1_pins: i2c1 {
+		input-enable;
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RIIC2_SDA */
+			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* RIIC2_SCL */
+	};
+
+	qspi0_pins: qspi0 {
+		pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3",
+		       "QSPI0_SPCLK", "QSPI0_SSL";
+		power-source = <1800>;
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(13, 0, 1)>, /* SCIF0_TXD */
+			 <RZG2L_PORT_PINMUX(13, 1, 1)>; /* SCIF0_RXD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(6, 0, 4)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(6, 1, 4)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(5, 3, 2)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(5, 4, 2)>; /* SCIF2_RTS# */
+	};
+
+	sdhi0_4bit_pins: sdhi0-4bit {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <3300>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * These pins are fixed-function lacking independently configurable
+		 * pull-up, pull-down or output-disable.
+		 *
+		 * While unused, disable the input buffers to avoid sampling the still
+		 * physically connected but unused eMMC lines.
+		 * For output direction rely on correct controller bus-width configuration
+		 * to avoid over-voltage to eMMC e.g. when operating at 3.3V for a 4-bit microSD.
+		 */
+		sd0_dat47 {
+			input-disable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+		};
+	};
+
+	sdhi0_4bit_uhs_pins: sdhi0-4bit-uhs {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * These pins are fixed-function, lacking configurable pull-up, pull-down or
+		 * output-disable, while sharing the voltage domain with all SD0_* pins.
+		 *
+		 * While unused, disable the input buffers to avoid sampling the still
+		 * physically connected but unused eMMC lines.
+		 * For output direction rely on correct controller bus-width configuration
+		 * to avoid over-voltage to eMMC e.g. when operating at 3.3V for a 4-bit microSD.
+		 */
+		sd0_dat47 {
+			input-disable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+		};
+	};
+
+	sdhi0_8bit_uhs_pins: sdhi0-8bit-uhs {
+		sd0_ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		sd0_dat {
+			input-enable;
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+		};
+	};
+
+	sdhi0_cd_pins: sdhi0-cd {
+		pinmux = <RZG2L_PORT_PINMUX(0, 0, 1)>; /* SD0_CD */
+	};
+
+	/* SD0_RST is only routed to eMMC which uses fixed 1.8V IO voltage */
+	sdhi0_rst_pins: sdhi0-rst {
+		pins = "SD0_RST#";
+		power-source = <1800>;
+	};
+
+	sdhi1_pins: sdhi1 {
+		pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3",
+		       "SD1_CLK", "SD1_CMD";
+		power-source = <3300>;
+	};
+
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(17, 2, 1)>, /* RSPI1_MISO */
+			 <RZG2L_PORT_PINMUX(17, 1, 1)>, /* RSPI1_MOSI */
+			 <RZG2L_PORT_PINMUX(17, 0, 1)>; /* RSPI1_CK */
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(17, 3, 1)>; /* RSPI1_SSL */
+	};
+};
+
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q80bl", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		/*
+		 * The BT is based on BCM4343A2. Murata 1YN variant seems to
+		 * require driving RTS on open.
+		 * Use compatible bcm43438 to accomplish this.
+		 */
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <115200>;
+		shutdown-gpios = <&pinctrl RZG2L_GPIO(2, 3) GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&reg_pmic_buck4>;
+		vddio-supply = <&reg_pmic_buck4>;
+	};
+};
+
+/* WiFi */
+&sdhi1 {
+	/* Murata 1YN max rate is 50MHz */
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	cap-sdio-irq;
+	mmc-pwrseq = <&sdhi1_pwrseq>;
+	non-removable;
+	no-1-8-v;
+	no-sd;
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/*
+	 * Host controller IO voltage is provided from reg_pmic_ldo2,
+	 * WiFi module IO voltage from reg_pmic_buck4.
+	 * Neither is configurable at run-time so either can be set here.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo2>;
+	status = "okay";
+};
+
+&usb2_phy0 {
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
+&wdt0 {
+	status = "okay";
+};

-- 
2.51.0

