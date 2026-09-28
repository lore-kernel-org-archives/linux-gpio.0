Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020136.outbound.protection.outlook.com [52.101.84.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88424EB86D;
	Mon, 28 Sep 2026 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.136
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612486; cv=fail; b=kF41WTah7cjGuO1861ygmwmqCtzaGXEI1me4oGu3lIsz+xkdZWVC9p/M4ZQNN4fJLcX8jLVDpYc6+qcEqqfmQhM+/3kMG0voOkWmVPFlOTqB9WJ6kAmgs1l5GEGeXo5/hqHBnyMpg4qzlK5KwYbafQbbVqJLjmfGrfJbFwzYAVA=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612486; c=relaxed/simple;
	bh=Qczb/p1hN+sJ7U5j9EtDkQ0g6nzsuD+a0Gim8leXZ6s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NposTAVp6/27P2ie5MX93g/zA9oiSsckv7+b1U26I3ug86U2rlB/C0QeQPH4dSH2/B7+4sWjlqZcUin/O9yoR8FwdZGL1hICS9B0k2y6L5OAeeH9qxWWg1+SIzJf3iwhp89VMdjdKIxgAMYzBfuZo0EfWkG53NaRRiNjU0k2rd0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=s086r3yB; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=s086r3yB; arc=fail smtp.client-ip=52.101.84.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="s086r3yB";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="s086r3yB"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ho2OK2p/bwBfQy9GjX/RPoUC9kVsEkDdXfWsHh/b298GaaguF5KVmxZMzPeXMpCMoT9ZNu4sajmq+qVvs9au5OV2pim6l+y2b1EhtdcbBPtyFSTMWs+GbCCGjn6+QWr3Gt7J0m4Au1fLFY1zNAvuz+/23mVEMfWMC5mXw/n/eSyahey3Yl67DXo1zaOQbyvg4q5p0d8K8QF8G5CxDcAaP6RsWogbG8soS/nPq7mXJBcJx2VUCbGQbFDwtAPGSWA1iVcJxkGSOJ0QUGo39deKmpOQOg2v81Cp32ur1J25HTqQscSHVic/r3hNoimifELoUWse5dTwBvcd9LFDhnoyuw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qczb/p1hN+sJ7U5j9EtDkQ0g6nzsuD+a0Gim8leXZ6s=;
 b=Bw5tWD46VShl8M6IznZGnPmXKHLcvNgQ4Ft85TtSLBoFsk520GEF++YrRXci3Z7W0wucnGKYgKA19KcxUeXsC2EMgIXCmkS22juIt8ZvmfzlEy9Ofb25aqndPWknHmAcc1Pu88HRolgoJ8ccteGG6DGainEHLrGHCwuQPebKd8U5ZPHDAnlvSXdfxW65gPb5b42LAxu8LqXsjhzI2CrfPr/fHXraJrh1+n6O9IGcrLsWRJMbdXQ5Pm5DbPX8H2XuMSkpFDb4BMKXcQUjIZobxW9qBbKdWLWutv8Vib7yXkYa5zgKK3kHzZc/ebfMwtbEM6haWQbxNgnN9nFiZq1AQg==
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
 bh=Qczb/p1hN+sJ7U5j9EtDkQ0g6nzsuD+a0Gim8leXZ6s=;
 b=s086r3yBuD3RttzSzMjZSCwPjJ0FbYdRLF4efwnMHVjb82xsFboSEnVAKfjTvksEzDI/m3a+ibe1VnmFl+Wzt09owQRh/evamAgBCZK9pyEbgt6irHV7DeE9vw+m5ayDqUv928AymZU1WLrU3YmS+F1Jlr10tyiuKMPFrksb+BTm3hXLWrs3d8NgKmlpPMtiS4IcXU0yaaEqVRjpcEefTdbZJFSZtnlQHgjjuPPh8yNOAgSteyKG2CZjVyZFXm2Pgb4LETMm6Rrtw//kKdu4OpY0CISbKm4M687WlCR8DD8CwKj6gT4Sv1jS0XJ9Ogzfney/uJxcOUIY6US0l6fU1A==
Received: from PAZP264CA0166.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:236::6)
 by DBBPR04MB7561.eurprd04.prod.outlook.com (2603:10a6:10:209::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 16:21:19 +0000
Received: from ZR1PEPF0000E460.eurprd04.prod.outlook.com
 (2603:10a6:102:236:cafe::18) by PAZP264CA0166.outlook.office365.com
 (2603:10a6:102:236::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 16:21:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 ZR1PEPF0000E460.mail.protection.outlook.com (10.167.241.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 16:21:18 +0000
Received: from emails-323255-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E236C7E925;
	Mon, 28 Sep 2026 16:21:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790612477;
 b=EavMzGm0hlXHfTrlCbjtTAqgp9QPczuzW8sh+zsypEWEP2yavdmbUWpgyl0t/j11O4RG5
 yNwsvH/y2EuJ5IuKUHLWGOv3CqjNYF8kV8erqQ8rT7ujdazFOBAiNPM/DY/YvoIVBbGWEBO
 GNC/wMyk5DPGqQhxT34jYjQIpZenQ5E=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790612477; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Qczb/p1hN+sJ7U5j9EtDkQ0g6nzsuD+a0Gim8leXZ6s=;
 b=aaow7RNA1g9yjDvvuop3KpIKgO9WIpixeD6fLfKV8jVC2mGidPDpPV/HELGsXEe6d6xC8
 3AxEh3Zr5DULP5eJ3DfBWjzhgU63J0ojqvwLkvVEMDBXkTCBMuMfFi2atwzziJ8+f1c1lJd
 WqbBAhhtSoRIuOcuB1SK5kpT+D3MUt8=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qczb/p1hN+sJ7U5j9EtDkQ0g6nzsuD+a0Gim8leXZ6s=;
 b=s086r3yBuD3RttzSzMjZSCwPjJ0FbYdRLF4efwnMHVjb82xsFboSEnVAKfjTvksEzDI/m3a+ibe1VnmFl+Wzt09owQRh/evamAgBCZK9pyEbgt6irHV7DeE9vw+m5ayDqUv928AymZU1WLrU3YmS+F1Jlr10tyiuKMPFrksb+BTm3hXLWrs3d8NgKmlpPMtiS4IcXU0yaaEqVRjpcEefTdbZJFSZtnlQHgjjuPPh8yNOAgSteyKG2CZjVyZFXm2Pgb4LETMm6Rrtw//kKdu4OpY0CISbKm4M687WlCR8DD8CwKj6gT4Sv1jS0XJ9Ogzfney/uJxcOUIY6US0l6fU1A==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AS4PR04MB9316.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 16:21:08 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:21:08 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara
	<benjamin.bara@skidata.com>, Linus Walleij <linusw@kernel.org>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
Thread-Topic: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
Thread-Index: AQHdT1c5zjX6e9DUV0StdEu6eeP1PbbkKQsAgAADAgA=
Date: Mon, 28 Sep 2026 16:21:08 +0000
Message-ID: <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
 <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|AS4PR04MB9316:EE_|ZR1PEPF0000E460:EE_|DBBPR04MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e5df07-333c-4755-7324-08df1d7c86c7
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|23010399003|10070799003|366016|1800799024|38070700021|56012099006|4143699003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 tN9do+m8MV6hqusAF/hk2Wtp/KLOVqu9fFjDzcwVaqtgmNhz2GxjYnaT8csVf2LcTQI3Pe6Z8D6EzDVpAQB/+iIruGi0t7/0wlCqXzQqj06RtMW/mHgtXi7tZ7WftfVCYWEl2hRSpfjkFvqukySadKeePepMoNlyS5ENDhhf5qYMSQKnMd/x3qhvNTSwLtQT/cn6iuZwWiYGsGn/I9LjkM+UvelEU1UCEFvGFYAL5VR/iVyiNvS37+MEIzZ3NVN7+cOvEy2GZKGPjfH56PoApp+0AwGQfyysZVpwXXh45EdJia2rualvmsEKod4cETL5EFyZEPtv85/49ac5KnMNE6WqqlI/tb3PwfhzAVfDkwPMi+EUUNZARDS8b+bphFt9HOR1Uee6ZPYDpVxKuCSFzBbJ6dD+yMKWySBc+29YMlx0Ly51bLU8y+wTdnzIa3wNzry3xP23+p3i0rFD9lg8/GXIWjPHmlMBGfZBtKqItklxYL7gNrkJMSUjQmSuRGVTCygYwgZAXlCzbiJ237cKNvFUfozy2sH6z47aNcjApUojoXAu7J8lo2FT1kOUA6YFRWIYJtNF0xo1Bqnuvu0NEnwYcvLoD6cRi+PsfvPnK0Rli//Hs8aywy9QB0tVzUNBXHjeqdFPLC4C+Ky48Pl+R2GF82Z1DF9Khv2RoukRAWc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(10070799003)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A07144C94B8D4244BB018C2DAF48B80E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 k6xD9KwdE7qf2njBwszwVIKCJocJiJEalwBjPl5KpNs2znDGfJNDNoQ925XPg5SYpuTsp4yzZBEEDvX4rlQFJrvNioonRODZT8AxrNwqkyG465XQD1hJhNf07nSg76DS64Q8MhskpN6v/hqhk1vvlMCPUdypFJGpUgCsJM3RLn4jfOumu+OJDeFJX91/kpYiWaOuP6EkCgcQ3tx33Enx3Be4mpn2qJPkrTLl9GR/BepMPmPi94PdF8mo9B098Rt9HJDzvNM5EuEihDLadDGULAuKy720C9VqBcF/CJrvKD1Xda/IFXjhKUqkBwCpJTP0FdNowd7eHUAS7ZTBRGvrzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9316
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0a50c00b53d74f0fbe96af464cb7c7e4:solidrun,office365_emails,sent,inline:3e0610331c603246cba0de88078a76e6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SShtFUg1u7QgiOoq6jHvm0iLpDptf7MX2eFEztnIA2qlk3444AK4fep56OtntfxhosdWo9ILFyU6Mfow0w74wMh8GlKtVAxRT8h1lVq6oOuDPSejVROk+2O1qorIruHGYjI1Lqe2lCRO9xlTOg2paHKTn+1bya4Yre0qtJIX3HUomGIT4Z6QN6zXNIUgRAsdBaL49uFZcL2H2xo1BtArBP9yZBk9dF214j1X4p1WkqOj00uGYrJHE3piTu0Tn4dlKhNSKj/tFAZL8hoCyp5/tkIjg082lWScmnimQKZQIAgY8prYwmK1gtlq4C6xdUXOMYtl38ZebzgH8CoNh1HBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qczb/p1hN+sJ7U5j9EtDkQ0g6nzsuD+a0Gim8leXZ6s=;
 b=TOJ+QC4tBtIj5E3mxOfpcz/t3VFwBkkWsCycq3GySD0o9PqOn7Zo7NocuDOTOGaVzdtFiJemEvtMrdPON5O2NAlzO2g31pugR8kVGUMEZ2QcRVsI/Ri3eRaU7eKLxfl3lyEa4gwUN9arsAu4tG6ayTX9d8J0GKChbpmPlXNQsEMnWUyULrVudafIuv3PcMqM8Z5CHjPJ4Bb9jncAfYPDQ4YozpABjLQ1ku99Rb3Bz6xzMdG3NWIkA/I8PUObm/IVKwDg/+76mou9KxI9LuOU2JBG34y2XcKlRLV/5bc/SDNX8pzzWiI5VJuLXkdJcyC6h7x6YK3gVHx7Qy+3VZIZHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E460.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c9dbb71-904a-4824-c8d9-08df1d7c8109
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|35042699022|14060799003|36860700016|23010399003|18002099003|22082099003|10067099003|13003099007|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	h82FdlCffF8wZkiONyFc7EepD2T6UdG4o1TzSSfbVUvEDJEKCX9BFAqGEYlQnHzXyL0qKvs2Rztr7iStrh8kTeCPj6lY6OLYh60H006G0+QA3/HwdN5KmogWVpjJi+UjkrEZP2kbfcHPdK2zbobObSe8zKGJ/VChJNc6LHJzH8GfPvlXbSbHA48tOXc9PfuyhOuMsbZL842B5gxUfSjSpA4pOpKwMTYRb0t01kII1nOYyrfX4iLBuBlgpjWbH/XjeSiEKugFY9ly1Y+77iPxLkTiKDBOYCbGOo4GlfmHvafrO7Qc96ogi6AMv1VeXZuo2KDpVG/5m9Zp1ASo7zoeQCCWQqSccfx9yZuD2pOvaGHYZsqc3/sqtBbzKn+WZeCumN7TA0WXPycquP7cgQ3nRCYk9BZ+MxNEvN+A5QjSM2XYP9eep0mwx21lD6+RZ8v3mOoQSXEQF5bD8jqNrDsczchePe+hAh62X1npEx4gyfzw7xCJ6G2dkcOkYdFcISCDCFWUXAh0TNUDYl1XTMRuvycl41mSt9mth5vhTn9TwiMfw72kM5jK/75DfANZz/v50EK3SlimjQN6LaAJ2CaVigHHA59IrYZ8xx3pdfbThnt2bfeRdvpGt+CoaugOaRNPJYm1XB7PdH0VAirgsp1Atb8xZHDsIhAaQyneCwu5G6M=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(35042699022)(14060799003)(36860700016)(23010399003)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VYzaUqeunmdmwBPbdUHH7LruyY10LA8DqxWNHMs5HD6g2q5DlxicY2U9hwStLRr6WYL2Qz/tCKtM+3bko82FtO9QzpTzGe8kWligwpk7kJDNVHlIjAhsH12xkaLA4cDvImPv/Z8C9Y98ycgZp+KDnZ8AsWsKawR5hR3eXs5eJ/EVyB+w+aYE5GPawQHR75A3Pu0apEAqgZCKagQ8YH9MadDDvOiH27skZxuLycNODh6HvWBqNciAyZjTkKkVoVmjLaF8qUx5kFWPFbIPqGDt1RCeSVUzXdGUzl7lTZLrf+4YnvArhkp+05b0FmN33KCO+G/2QvTTpu3uHjNVcl01wgO2zyXLElx1VyVp0yoWHSiKRvsTfz/oXoDrvPe0x82JriYo+CfFI/uLtt+4n4v4VOSFtJSW3hmB0SrcqG/ZW/C2i8BznN5OtmuHede8VoWe
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:21:18.2941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e5df07-333c-4755-7324-08df1d7c86c7
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E460.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7561

QW0gMjguMDkuMjYgdW0gMTg6MTAgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+IEhpIEpv
c3VhLA0KPg0KPiBPbiBNb24sIDI4IFNlcHQgMjAyNiBhdCAxNjo0MCwgSm9zdWEgTWF5ZXIgPGpv
c3VhQHNvbGlkLXJ1bi5jb20+IHdyb3RlOg0KPj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBTb2xpZFJ1
biBIdW1taW5nQm9hcmQgUmlwcGxlIFsyXSB3aXRoIFJaL0cyTA0KPj4gU29NIFsxXS4NCj4+DQo+
PiBUaGUgSHVtbWluZ0JvYXJkIFJpcHBsZSBpcyBhIHJlZHVjZWQgdmVyc2lvbiBvZiBIdW1taW5n
Qm9hcmQgUHVsc2UsDQo+PiBmZWF0dXJpbmc6DQo+PiAtIDJ4IFVTQi0yLjAgVHlwZS1BIGNvbm5l
Y3Rvcg0KPj4gLSAxeCAxR2JwcyBSSjQ1IEV0aGVybmV0DQo+PiAtIG1pY3JvLUhETUkgY29ubmVj
dG9yDQo+PiAtIG1pY3JvU0QgY29ubmVjdG9yDQo+PiAtIG1pbmktUENJLUUgY29ubmVjdG9yIHdp
dGggU0lNIHNsb3Qgc3VwcG9ydGluZyBVU0ItMi4wIGludGVyZmFjZQ0KPj4gLSBNSVBJLUNTSSBD
YW1lcmEgQ29ubmVjdG9yIChub3QgZGVzY3JpYmVkIHdpdGhvdXQgc3BlY2lmaWMgY2FtZXJhKQ0K
Pj4gLSBSVEMgd2l0aCBiYWNrdXAgYmF0dGVyeQ0KPj4NCj4+IFRoZSBjYXJyaWVyIGJvYXJkIGlz
IGlkZW50aWNhbCBiZXR3ZWVuIFJaL0cyTCwgUlovRzJMQywgUlovRzJVTCBhbmQNCj4+IFJaL1Yy
TCBTb01zLCB5ZXQgb25seSB0aGUgUlovRzJMQyBjb21iaW5hdGlvbiBoYXMgYSBwcm9kdWN0IHBh
Z2UgWzJdLg0KPj4NCj4+IFdoaWxlIHRoZSB2YXJpYW50IGJlaW5nIHN1cHBvcnRlZCBoZXJlIGlz
IG5hbWVkICJSaXBwbGUiLCBzaGFyZWQgaW5jbHVkZQ0KPj4gZmlsZXMgYXJlIHN0aWxsIG5hbWVk
IGFjY29yZGluZyB0byB0aGUgZnVsbCBib2FyZCBmb3IgY29uc2lzdGVuY3kgd2l0aA0KPj4gc2No
ZW1hdGljcywgc2lsayBzY3JlZW4gbGFiZWxzIGFuZCBvdGhlciBTb01zIG9uIHNhbWUgYm9hcmQu
DQo+Pg0KPj4gRGVzY3JpcHRpb24gZm9yIG1pY3JvU0QgaXMgc2hhcmVkIHdpdGggSHVtbWluZ0Jv
YXJkIElJb1QuDQo+Pg0KPj4gWzFdIGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5jb20vZW1iZWRkZWQt
aW5kdXN0cmlhbC1pb3QvcmVuZXNhcy1yei1mYW1pbHkvcnotZzJsLXNvbS8NCj4+IFsyXSBodHRw
czovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90L3JlbmVzYXMtcnot
ZmFtaWx5L2h1bW1pbmdib2FyZC1yei1zZXJpZXMtc2Jjcy9odW1taW5nYm9hcmQtcnotZzJsYy1i
YXNlLw0KPj4NCj4+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPg0KPj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlk
LXJ1bi5jb20+DQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4NCj4+IC0tLSAvZGV2L251bGwN
Cj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDRsMi1odW1taW5n
Ym9hcmQtcmlwcGxlLmR0cw0KPj4gQEAgLTAsMCArMSwxNyBAQA0KPj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICsvKg0KPj4g
KyAqIENvcHlyaWdodCAyMDI1IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4g
KyAqLw0KPj4gKw0KPj4gKy9kdHMtdjEvOw0KPj4gKw0KPj4gKyNpbmNsdWRlICJyOWEwN2cwNDRs
Mi5kdHNpIg0KPj4gKyNpbmNsdWRlICJyemcybC1zci1zb20uZHRzaSINCj4+ICsjaW5jbHVkZSAi
cnpnMmwtaHVtbWluZ2JvYXJkLXJpcHBsZS5kdHNpIg0KPj4gKyNpbmNsdWRlICJyemcybC1odW1t
aW5nYm9hcmQtcHVsc2UtbWljcm8taGRtaS5kdHNpIg0KPiBUaGlzIG5ldyBpbmNsdWRlIGlzIG5v
dCBuZWVkZWQsIGFzIHJ6ZzJsLWh1bW1pbmdib2FyZC1yaXBwbGUuZHRzaQ0KPiBhbHJlYWR5IGlu
Y2x1ZGVzIGl0Og0KPg0KPg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3J6ZzJsLWh1bW1pbmdib2FyZC1yaXBwbGUuZHRzaQ0KPj4gQEAgLTAs
MCArMSwxMjUgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArLyoNCj4+ICsgKiBDb3B5cmlnaHQgMjAyNSBKb3N1YSBN
YXllciA8am9zdWFAc29saWQtcnVuLmNvbT4NCj4+ICsgKi8NCj4+ICsNCj4+ICsjaW5jbHVkZSAi
cnpnMmwtaHVtbWluZ2JvYXJkLXB1bHNlLWNvbW1vbi5kdHNpIg0KPj4gKyNpbmNsdWRlICJyemcy
bC1odW1taW5nYm9hcmQtcHVsc2UtbWljcm8taGRtaS5kdHNpIg0KPiBTYW1lIGZvciBwYXRjaCBb
MDkvMTFdLg0KPg0KPiBQYXRjaCBbMTAvMTFdIGlzIGZpbmUsIGFzIHRoYXQgb25lIGRvZXMgbm90
IHNoYXJlDQo+IHJ6ZzJsLWh1bW1pbmdib2FyZC1yaXBwbGUuZHRzaS4NCj4NCj4gQXMgdGhlIHJl
c3QgTEdUTSwgSSBjYW4gZml4IHRoYXQgd2hpbGUgYXBwbHlpbmcsIHNvIG5vIG5lZWQgdG8gc2Vu
ZA0KPiBhIHYxMC4NCg0KVGhhbmtzIQ0KDQpTaW5jZSBTYXNoaWtvIGFsc28gZm91bmQgYSBzbWFs
bCBpc3N1ZSBpbiBwYXRjaCAxMS8xMSAuLi4gdjEwIGNhbiBzdGlsbCANCmJlIGNvbnNpZGVyZWQu
DQoNClRvIHRoZSBpbmNsdWRlcywgSSB3b3VsZCBhY3R1YWxseSBzdWdnZXN0IGEgZGlmZmVyZW50
IHNvbHV0aW9uIGZvciB0aGUgDQpkdXBsaWNhdGUgaW5jbHVkZSwNCmNvbnNpZGVyaW5nIHRoYXQg
SSBnb3QgY29uZnVzZWQgYWJvdXQgaXQ6DQoNCmRpZmYgLS1naXQgDQphL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOWEwN2cwNDRsMi1odW1taW5nYm9hcmQtcmlwcGxlLmR0cyANCmIvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NGwyLWh1bW1pbmdib2FyZC1yaXBwbGUu
ZHRzDQppbmRleCA0OTNhMmI5YjUxZDI1Li45NWEzNmY4ODA0YjU1IDEwMDY0NA0KLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NGwyLWh1bW1pbmdib2FyZC1yaXBwbGUu
ZHRzDQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0bDItaHVtbWlu
Z2JvYXJkLXJpcHBsZS5kdHMNCkBAIC03LDggKzcsOSBAQA0KDQogwqAjaW5jbHVkZSAicjlhMDdn
MDQ0bDIuZHRzaSINCiDCoCNpbmNsdWRlICJyemcybC1zci1zb20uZHRzaSINCi0jaW5jbHVkZSAi
cnpnMmwtaHVtbWluZ2JvYXJkLXJpcHBsZS5kdHNpIg0KKyNpbmNsdWRlICJyemcybC1odW1taW5n
Ym9hcmQtcHVsc2UtY29tbW9uLmR0c2kiDQogwqAjaW5jbHVkZSAicnpnMmwtaHVtbWluZ2JvYXJk
LXB1bHNlLW1pY3JvLWhkbWkuZHRzaSINCisjaW5jbHVkZSAicnpnMmwtaHVtbWluZ2JvYXJkLXJp
cHBsZS5kdHNpIg0KDQogwqAvIHsNCiDCoCDCoCDCoGNvbXBhdGlibGUgPSAic29saWRydW4scnpn
MmwtaHVtbWluZ2JvYXJkLXJpcHBsZSIsIA0KInNvbGlkcnVuLHJ6ZzJsLXNyLXNvbSIsDQpkaWZm
IC0tZ2l0IA0KYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDU0bDItaHVtbWlu
Z2JvYXJkLXJpcHBsZS5kdHMgDQpiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cw
NTRsMi1odW1taW5nYm9hcmQtcmlwcGxlLmR0cw0KaW5kZXggM2RmN2M2N2Q3NWEyNS4uMGM3Mzg3
MTUyNDU0MSAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cw
NTRsMi1odW1taW5nYm9hcmQtcmlwcGxlLmR0cw0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I5YTA3ZzA1NGwyLWh1bW1pbmdib2FyZC1yaXBwbGUuZHRzDQpAQCAtNyw4ICs3LDkg
QEANCg0KIMKgI2luY2x1ZGUgInI5YTA3ZzA1NGwyLmR0c2kiDQogwqAjaW5jbHVkZSAicnpnMmwt
c3Itc29tLmR0c2kiDQotI2luY2x1ZGUgInJ6ZzJsLWh1bW1pbmdib2FyZC1yaXBwbGUuZHRzaSIN
CisjaW5jbHVkZSAicnpnMmwtaHVtbWluZ2JvYXJkLXB1bHNlLWNvbW1vbi5kdHNpIg0KIMKgI2lu
Y2x1ZGUgInJ6ZzJsLWh1bW1pbmdib2FyZC1wdWxzZS1taWNyby1oZG1pLmR0c2kiDQorI2luY2x1
ZGUgInJ6ZzJsLWh1bW1pbmdib2FyZC1yaXBwbGUuZHRzaSINCg0KIMKgLyB7DQogwqAgwqAgwqBj
b21wYXRpYmxlID0gInNvbGlkcnVuLHJ6djJsLWh1bW1pbmdib2FyZC1yaXBwbGUiLCANCiJzb2xp
ZHJ1bixyenYybC1zci1zb20iLA0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yemcybC1odW1taW5nYm9hcmQtcmlwcGxlLmR0c2kgDQpiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yemcybC1odW1taW5nYm9hcmQtcmlwcGxlLmR0c2kNCmluZGV4IGQ1YmQ5Yjdk
ZTQyODIuLmFlYjkyNjMwZjRjNmIgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJkLXJpcHBsZS5kdHNpDQorKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJkLXJpcHBsZS5kdHNpDQpAQCAtMyw5ICsz
LDYgQEANCiDCoCAqIENvcHlyaWdodCAyMDI1IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4u
Y29tPg0KIMKgICovDQoNCi0jaW5jbHVkZSAicnpnMmwtaHVtbWluZ2JvYXJkLXB1bHNlLWNvbW1v
bi5kdHNpIg0KLSNpbmNsdWRlICJyemcybC1odW1taW5nYm9hcmQtcHVsc2UtbWljcm8taGRtaS5k
dHNpIg0KLQ0KIMKgLyB7DQogwqAgwqAgwqBhbGlhc2VzIHsNCiDCoCDCoCDCoCDCoCDCoC8qIHRo
aXMgYm9hcmQgZG9lcyBub3QgdXNlIHNlY29uZCBwaHkgLyBldGhlcm5ldCBvbiBTb00gKi8NCg0K
