Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023078.outbound.protection.outlook.com [40.107.159.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A5148123E;
	Fri,  4 Sep 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.78
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523024; cv=fail; b=XGDWiO49Nk3agUs2zknN/rbROco7Wqk+1WVPaW8/VWUA3nmdLgM1e+7RakMBRvM9Skv7stu0RtNtXxdDephO25yGzJJotdjwcVcs8sIRHlrqgRyQ3rR5CllYVLeS/AyMLEgeya7iLCoS/EbewlkvP+QPRpZ/AiRwZrM4wvpN3wA=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523024; c=relaxed/simple;
	bh=2RlSAGdup0uWI8eXkWBZuWWO1eqfpbo02LIB/A3l9rk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NcavwKbZVWBjPHdoow74fhmXgaMrvH/he/6bHrhVBa3I6awNtkRqhnVUK/ieZEVhyZ6dl20+bb30FC8gQ/nI7MHdNXF3qbcRivX2eRY6XGqxr58un/eB+wOoOK03nE1zRYqPuIl6fS3yh/ZD3pFlkaNyW5FFB528GhqN6QTo7Dk=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=nZemK++/; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=nZemK++/; arc=fail smtp.client-ip=40.107.159.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="nZemK++/";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="nZemK++/"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qFHNQo6XOHSpEFXh+CUs/BZE1Qy0AAA+Zd20SowwIH2V0m+aGIsS4bQ52ZAy2t45eXeHB7eP/4Nt4VV0FPkbXTewVRxLf7TDo2dMYHKWtv6IUxIN4kJpjx26BhuuxAZv+EBXPOzwllOVCI4Z2e33BGx71Vxm754kUN2/WfgU+TL0nrhIzNnsZ12acIuE0OR+U2KrpQRLxoG+0D1XD4HU1CrOCAC8wbQ9B+v8h0pK1pz6djfF0BkBUgRruUhYw+gtmpuvXixUksxYavfOAm6wi52BK18nfmDr91KQVCLM0k/2L1A3U03W7HsEXl7RGaOIkzqPHHaWVJVTLncJ1Dwv6w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQv9rCZx1nYTI3ukfu4Y+fPgV4jcmWd8DO9DY0rBnno=;
 b=TI/FciBzSGn6P+XIeDY6HcOMlq7Otsxk1UxUzfZhAYGeoLZhtgV0yHyXxBsLiJnvMtqL0PkSRCx94v4p601tlccRUrcSeAzlaj04H6Vu8Dqg2WykRCxlqRg1c9xL3bIdj9j0mCj9ScTwxc1yl+I4TPEyIazhSXvPuoGqYmcAJG4SguEu5hJCp5HKlZawl1Wn/LKioJBEeWwuHgTE97fYCB/bwyMrgVbvQTep71/GXZaxvl7U7mkIAzW7vS2GWtmLxvy+g+C51T+ny522v1xvHI4uFpMLyhWV3N1uJjTrlKhUD9+sM/9NHHvskrm1B19iKziwZtHOC8c8KzO31LOduQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQv9rCZx1nYTI3ukfu4Y+fPgV4jcmWd8DO9DY0rBnno=;
 b=nZemK++/FoEAsuuuxEAFm4rh4rL186RpHa222aOwH96O/w1qgljMgLLSl7p4nU49TOTXgqNQiMrqPMAw4eMUp+vheWIRbmdYsKlxtgMXsipKQYZGqtMfpQlIoHc2Rb6q/4vazBsKDKPcV6JJh67VD5A0JY1zV/xVKssRk6Do9PsGJufxbQPMY6bBafudv/QUf5GYA9GpUDlCD+1pUkqcifuI4g0n1C23izs4siOX1iFcyItnKMoACBye2zruzrmNw8b2NYgas75ImzaaGHCYGIxl5gICCcbmEPEHCf3mY3gEV8zTpygKXaDHcAnSqZ1VUuv0/QrCV+039A9yzEplrg==
Received: from PAZP264CA0226.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:238::17)
 by VI2PR04MB10907.eurprd04.prod.outlook.com (2603:10a6:800:271::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:56:52 +0000
Received: from AM7PEPF00000054.EURPRD83.prod.outlook.com
 (2603:10a6:102:238:cafe::54) by PAZP264CA0226.outlook.office365.com
 (2603:10a6:102:238::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 11:56:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM7PEPF00000054.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.1
 via Frontend Transport; Fri, 4 Sep 2026 11:56:52 +0000
Received: from emails-6378051-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3D5CD7EB53;
	Fri,  4 Sep 2026 11:56:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788523012;
 b=KdNFnCPFC1fGsxelcpYituIUF57LUKsi1HD3H0ksB3nHNtbCxCNbRMfU0cbEKP0TWjtTw
 Mc1s+mxGcbv6pJExp3bWY5qRRYpYNEWBrz2+bYp+jmic0WqUoT7I/Fxu9tgeYVz92saB08K
 10SVIiqYOg3pFEWbQr4Ug3iVYQVQ5I4=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788523012; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=mQv9rCZx1nYTI3ukfu4Y+fPgV4jcmWd8DO9DY0rBnno=;
 b=S6do22VAsdigj6gqVjssSS3cP6C8ZHX4TrBhmFAM3OQohiQeieqSU823wgHTn4pXhpUf4
 LZJyYKrWfZhDVGNC2AwwtShTNOd65gQKRMPU5CfeAKacyr9Sj/idLHeCvYa+4cjUrMwM/DO
 EL5gDjOXT/Kt4K6BLbRdc58u8iLUqqk=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQv9rCZx1nYTI3ukfu4Y+fPgV4jcmWd8DO9DY0rBnno=;
 b=nZemK++/FoEAsuuuxEAFm4rh4rL186RpHa222aOwH96O/w1qgljMgLLSl7p4nU49TOTXgqNQiMrqPMAw4eMUp+vheWIRbmdYsKlxtgMXsipKQYZGqtMfpQlIoHc2Rb6q/4vazBsKDKPcV6JJh67VD5A0JY1zV/xVKssRk6Do9PsGJufxbQPMY6bBafudv/QUf5GYA9GpUDlCD+1pUkqcifuI4g0n1C23izs4siOX1iFcyItnKMoACBye2zruzrmNw8b2NYgas75ImzaaGHCYGIxl5gICCcbmEPEHCf3mY3gEV8zTpygKXaDHcAnSqZ1VUuv0/QrCV+039A9yzEplrg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:56:41 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:56:41 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 04 Sep 2026 13:56:30 +0200
Subject: [PATCH v8 11/11] arm64: dts: renesas: add support for solidrun
 rzg2ul som on hb-ripple
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
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
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|DB9PR04MB9500:EE_|AM7PEPF00000054:EE_|VI2PR04MB10907:EE_
X-MS-Office365-Filtering-Correlation-Id: 8788488e-a9d4-43ff-5378-08df0a7b9c17
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|7416014|376014|52116014|10067099003|6133799003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 UcrijbhLs+P8ZtIoxi+gaPTSgBck6BvvzSNVBDXeNQVot7aArzRDlP2W6VPjCmttNGMvW+l5VBma/wXV+Hfy50atzpAqOxwW2CX7W8fyGL1DXayW8HdpCpoPhe1vhFMUs24AktHwJpH4ObrCMLIHDe4hGtP/lzDbiDHytsC25BV19JBD8mAKVWRkVHFt1NSzSID30N/2FpwSCIJafIaf7CgoikZGRQ/gUqgSdkSKDoCqAfK3t1LuV4e5rTaGjFqSycBpm+jPdYbiYqb9Yvv8soT2nlnUJG8nB/saqOb5kA+g6ibvs3ULltiqQpzyULfvPLZGYLmJ5tuvf87Uc07fpXKkoG3IeCLPev6Rp5lXjuG+DoKV+AlBPfRrLN0NWCt/chx+9Hcj3OWHCHEw7z9EIs7JrU+zw83LEkW5wvSOOW6d3DbN8OgIxftG1Kj/A1JHCb3CQYIRZXUDXjBPQ81P0kICncgVc8pDdKziVEIyeRCOCqP45jFUKWRZMNQxAzakAbe3nqdKIh918d7FcmB7Rf3OfAWQiilM4wrlPoBYI5CQ4VdsDNr+XTYmhzYVLZaCMFKb3kp9lwlVXatFFvUkw80MQ1U2PHr9OqcJ3eCLdnbpzP4dDsihQPUITM48FUZF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 co3hIwX+fWZGbu+Q+ikZvi2umsAcCmhH17SSwkgd4AXn3DC51CO/wfasOaTKfAGYPXmNxJTQUhfTUosOm7uEnX0VDUDpRNUnkJ4vaUcNTZgrJi9dT2wlzENyHy+/SSGSm3igNuaP9/gpmSSq4JBjJu8N3tO966B1jmv2h3fZt4VhXHTS3EX4ftM9AVJDMoP/A1MCHtpKSWzwqPA5NWgXKU/HBG2gH3WQYVGDO5tUOnPS3LGbGApyvGsVwEsTxSmyh7ujyJTh0xeMQYugkwhwrSzsyQz2r/7Vx1PfJKFHiri44JL2KXQZjGZ4JCnH0P9ivaa9sWEWzx6bud5hKC6TJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 28caa06a787d47e9b0d479f8430971bf:solidrun,office365_emails,sent,inline:284ae8a1cf75927e32739ded676cd9cd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQO3VKm7esz41iKCxOSTTFzOEER+p+2jCxdpg7YAAbmIU9gwE+VSVYPxWpXg/afWleTbkJHcBG+pkCLmNRUvr7RfglHouR7JQakprKIpE00LsCmSGOdP5oU6Sbzt5MQZ5+nMpH0eXb2yjMH3CCFJKxyTOx+Nfvg6iOKjUiF9r8/yhyLIVvVEjH8PflsFKk4ez+cj43OICow9xa0nd6/3saaDrk4MuTsSNM0+xQ5xqCSUaCxEy8MuoPrs4ddExIz36G5aF652CcduiBNqPzwD8VUzrqy1Zq2mK5T4Alv9BTBu9q9RDqMqyudknHpxpgCDwkcNVZArtw0GZPU9uRvAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQv9rCZx1nYTI3ukfu4Y+fPgV4jcmWd8DO9DY0rBnno=;
 b=wucvb7f9vWJ19eRPBXn1q68zH9/bXgzMPp+5k7bW4yPbCdBLrFZTUoY9HK8isH8OVyYqxotU/H7rgdtFoX8IU9eS9y+YBnGxtm7D9pJdqVOYR405DBulw2uGuxusmv/jNmNG8yPq0jukBMAhPeDCabelp2yWd2HT+py0dUem9fQ96ZjEb90xvCkxEXS8I8mjuj324WzPK4awVjZri2Yf9xNQcBvgjtrTiAjnGgMLqkgxE8Sj/s2wA8/vCSBl3tA0mU+9honSHw4JnvfpTOs4tIJEzTXmV+sQIDIQMsgAgMDCiQXj0NwwCNZY0bGZ+GYJr+s4ebcjNGfvfxxLPJh2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7PEPF00000054.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ba404f3-b201-4e13-d121-08df0a7b940b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|36860700016|1800799024|23010399003|35042699022|7416014|376014|18002099003|22082099003|13003099007|3023799007|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iEp4VH/gXD5esYG+A9jtk7YWWcgU25Frdd2fYy2spg2edSFknSlWzU4um4HJzqzLq+y858k/Slun+jWOqxAG0QoDxVNvn+MaQqILHX2S7YxZI3tGPlWZMmMFqeDMjHTVT1B17/bIXVVWPLZyrzA4Ea+IYMlmq84jf/zpo2YMSqbbd9EQ2Lk7XjsnqcJ78dIQBjJOy+PBw/ZjBmee1u52pubKeGOVHSxEKVQbejQ6SDqNdweoy0Kn4z0jQmdVqbL3piWFWD/gvy1KpoMK3oSXbV2RjO0AbH/o80qTR30XiQWZgRQVP/D/fbuZo9Lgjxge8JL6MTTQyO3dTpeAXLQmP52XcqjBMxJ3usSseO7x+CJXbNnh/Zu113jPHDrlYlFv70rMmhsoHjB+NN6N0UZTKGbidNfm+Twm38XStBR2tui1oXqDlTgWsHYQ/8bNftZpuQrzju704EqPQm/NM+LAW0bBVbDqRhCyXBGe5NQeSTo7gW5ryXWkH4g6myqjDgqfIC0pmntpcTGGM2a1M0ulyREps95KQ6uApVTvWq1pvvPgUSaPaIBY2r0N51perQI73+aE5FQZ3bEm4kWKIlkcjRXnocotr90aQxl+1rzXTESPQ13IDBypMDlf0V/x8Ejy
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700016)(1800799024)(23010399003)(35042699022)(7416014)(376014)(18002099003)(22082099003)(13003099007)(3023799007)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h1yUZm//BUaW/hEnENsD+igDAJKoi3l6JuTw711qrTQgFEyokCA1LWKIqZ6yvrvwgYuFQ8QGLsx0odrbj7uUSSSGYUkodZWQxVoIyVfBhYUxSQiOexKmzP6dDyrZwJ6ofvll9fim/fuNUWOdyUYvwwhNqwm+DjEJOQ98y441WnbV4s2RaNnME8sfNVMhZWp1XrX9lL3IeF+szcEQu2I2OsFLxfunfFnP6OvD+3/kIsEYsRReM8zghTOx1rtbPk7+BP0kdqF67jY/rOOLlqn49pm3m6/86r4QdWGyP7+uIJ4qm4/xo/EwA+xbNZ2KXfMf2E3bbmnB86dhLpzM+szYpz9CitJP7qR3ZHXQTzsik95fETDaSSyt0iayPWMtcTvXLAnraaSC28Bo/OxLmU/7Me2TZDSGFTGWkWoV/fYabjCNwKJh8tanJpcPLK6auDqV
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:56:52.4932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8788488e-a9d4-43ff-5378-08df0a7b9c17
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000054.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10907

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

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  10 +
 .../renesas/r9a07g043u12-hummingboard-ripple.dts   |  91 +++++
 .../renesas/rzg2ul-hummingboard-pulse-leds.dtso    |  48 +++
 arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi     | 437 +++++++++++++++++++++
 4 files changed, 586 insertions(+)

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
index 0000000000000..df78ddcc8258f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple.dts
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Description for SolidRun RZ/G2UL Type-2 HummingBoard Ripple.
+ *
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
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

