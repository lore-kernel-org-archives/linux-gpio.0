Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023107.outbound.protection.outlook.com [52.101.83.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85816463B96;
	Wed,  2 Sep 2026 11:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.107
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349862; cv=fail; b=p1eJGtL5e0rGFQhAf8/ST0szpWzZWwac2v7yXmf1ZUCoVukYbIt7jwe7jFocHTZ9SXEqfSMwhHFxy+ZVxXlBdoO7JeQ04gmaCa3SMZxLXmQHxMyrXORqHC6szLY4801YU7ivN4TGiQBLGTlf7O3y8y2Kw0d2neNaFWGUaJNo3qQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349862; c=relaxed/simple;
	bh=A8kz2CEkdUZIucfeDow35LTSLjIXCNnT6RBIO0+sm0c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=F/JMGXNLrlwxQqVXi8vQG4pyOSeHL6CGKyRUM55A/xfuBpb9PrknH4VH+Ifs0bK19Y5sKBGE0Bem5DnPSDyH8pT0tKrZdWzUO6Vk26d9f/+ZiCpTxsSeUMferj5lff/0adfZ4m12yGGjfUQzhSNLT+TbaxHW6m8Ayk0zp+3RPgY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=q6t42IZW; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=q6t42IZW; arc=fail smtp.client-ip=52.101.83.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="q6t42IZW";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="q6t42IZW"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kJlmew9CZ7cntVdEXGXy4H4L7eI0rnrf+hCBa/wJMkuz1L5qKVwxjTe/w4lgo6LomJZDmFfblDpnS2rrW1VpRbZR4eD8HebY6bWTYmlq6Gq0pXoDnixbWtjof0r7J1EUqq2ya1AMsTIkfi8kSkWVPPS03qr31GDWk2XH38K7knw5oMTvbmaJek/RDR+Ywmxdu/BBquzM/3u73B1s0BCHeguzfsVVR/Tli5I8Lv+3GLOeZ7YSlg/zFru/ofKyNppdZyzavU/cuLbdmtLGydQIkJm1+KbdcpYO48B5pT68QX2p4lIYJ8bUSRR7j8/PYwFXYOpUmNscd8gmYdbeo8T3Cg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=SNIwfsK4Tc79ZfwVe0uIAhUbpaxULnWwlfnfh0Bt8WFzRFMuGZWbmu6kWuwWZf6YB9fCrVwYmV6hzvzRMKlJZjnLoS27UWhI9lEo4FvP/veNs5kxa6KAED6VaS6PqkmlVfKwlztbpE6SBQlRTHyQYTOiWaHduKuTU4jFueondL55nNuFRollY5x/MtamBQG+dtzlp419GF6ilp5EU5DAx6ybq4GcwuMiS/eQlKoOAxNDpU4XZ2NceKvDhIzYBgqHQWRvSSAQ2x6tRIcPmklt5sLxyytBzqEn8FWC4dC4hTTRbr7tkTyHZxGejZ0p+lc53/xbKAI4nciWOHAijh3FoA==
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
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=q6t42IZWaQX0SsmEkAH9oXxyMW5Bug1uMABhgEenWSJUAN8Q920yxleqwsVhiTHZlLx8ur/JaAm0B63Rj8387WfdyT1/dzPrOkLYpZid/RzLrYZonuzWjPHOZ5OspwyvBwW/7ejzSihRP9ewzIC8+j8FiY52U0HorxWR3MuzxyFv59tvCpm27razysZPn+pC34oFdAm/biu4FpsMgTfo5r5c7dkaphgy3w5nIi5frdap7GnMXHdw4mLqXhm7JCo+dqUV35mBL4SUGDlnSk73Txaa2LGPxbMwMpdzuMainOUlVyA1yLrwzA6cHJYwCI9z3vB5nz06WUkB1c0YdoFUnQ==
Received: from DU7PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::12) by GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:50:38 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::62) by DU7PR01CA0018.outlook.office365.com
 (2603:10a6:10:50f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 11:50:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Wed, 2 Sep 2026 11:50:37 +0000
Received: from emails-8516449-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-87.eu-west-1.compute.internal [10.20.6.87])
	by mta-outgoing-dlp-814-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6F9AF81206;
	Wed,  2 Sep 2026 11:50:37 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1788349837;
 b=YFHacPGLG6zPaM+C8P97qXL1O7AJN3M7XhVM+4gzreHxmQ/3ERM1AWrOZmYl6VOnwReTM
 YVJ7zLvh7xIpELPSyrzZdMOT9+y2LplqOyLWxIXN4ntMvzY407XG0kRLiic2m6ECPI9Vxzl
 uuw9f+iJYDz3+KB1shrb/Xr6NqAfCuc=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1788349837; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=QkHll/v1bPM0a7X1j2O9ociQiGWrfzsHBAC/hjC4EXlAk/OLD38RHT/e4a7VY/YF3InDW
 ag3yTWV9RV36o8nktwuOso1HoXV1qb9HwNRceBuFlgXmzIf2DEtaq0HFfWtf0xZJJpDiA0m
 hVs6ji2FbLYC3AjwrY76+n5TVbEQ1n8=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=q6t42IZWaQX0SsmEkAH9oXxyMW5Bug1uMABhgEenWSJUAN8Q920yxleqwsVhiTHZlLx8ur/JaAm0B63Rj8387WfdyT1/dzPrOkLYpZid/RzLrYZonuzWjPHOZ5OspwyvBwW/7ejzSihRP9ewzIC8+j8FiY52U0HorxWR3MuzxyFv59tvCpm27razysZPn+pC34oFdAm/biu4FpsMgTfo5r5c7dkaphgy3w5nIi5frdap7GnMXHdw4mLqXhm7JCo+dqUV35mBL4SUGDlnSk73Txaa2LGPxbMwMpdzuMainOUlVyA1yLrwzA6cHJYwCI9z3vB5nz06WUkB1c0YdoFUnQ==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by PAXPR02MB8248.eurprd04.prod.outlook.com (2603:10a6:102:247::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 11:50:25 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:50:25 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 02 Sep 2026 13:50:09 +0200
Subject: [PATCH v4 1/7] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rzg2-sr-boards-v4-1-4a456a422fee@solid-run.com>
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::20) To MMZPR04MB400504.eurprd04.prod.outlook.com
 (2603:10a6:190:28::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR04MB400504:EE_|PAXPR02MB8248:EE_|DB1PEPF000509EA:EE_|GVXPR04MB12057:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b07fe41-a20a-4f42-f8e8-08df08e867bf
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|52116014|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 nn3ZzF4pffvheT6C7Py0D6wPx7WtEhkFwY5iRYcAwGPhJzCwqU24BeDqEIKWJc6Na3LmD6PX5eks8iYv4hgNMEgVI+vbtNrxJ1jN8rsVWaOHPXqJXZeErrAP2pPArH0aCBxPvVOiB3eglav94D3ka+xnhqz8qRR0saauPXkDr7O9GNDRaoRryd6iBmzmscQZCUsn/Mds4FYCAHghZ8u4wHp4YrTwvjmZ/sHoco5wr0PBSLQ6f1ta/zJn9J61/gXo/kelt20TyyyhlJKwFimVxCG6/rEU+GHmNjB9wXxXDizta2Vsi6CIWqZmzeoL5KQY+sYnmSdMx8fPfCwHqeI1emzsG596X9GEK75kEcBrK+fTk7WCF8R4pX5XKbRbeX9n88HOIEAcs2nUHI4uuJgxlMb0qtNgF0sykE7GdDz0jk6sxIERQ6M4Azz6HmHQpIdzLyZSH88S7ZCo2ICmSituw2l4/S1jelidLDiKrP3bNvsUmtG3LL0RG0/XkUa4M/+FglqiWjFxUKThhrL3HHHZrEr4Smf9K3dsXXGJi2lilHZSx1tKoZh1NU3wn3a+wNetgbhA3bONTuPIb7+K8s4UaTFtO9aRkagDHX9wRkyCyxs5cWB7bBNZMQIm0lYY36fW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(52116014)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 xdS6WFzRdFJ6ylAcAZnJWR0EqFH96ul7zQBsrjHguNlhDztTIV6QD5JLaMTmo2HbC3JTmVsPL94qm3q4GtfeD1vp4o1Nbmw7CG3pBUi0DRuyGosZzvCx0UWX7kjx52FS8KGevDa4kFkYSHyFytHw4ma6Jf/CuS5glS5F4yvful4lK6RDpRxoL9byYPnbe0TdvLaFBlDmMuEX1uE8j0eGbOOJ+zOQBm486u34ODP1hVn/1tdU/B6ktnvRYICbw5virB3PfyOMMzP/CghcUzXc4s7C/sdjDpgKk5+xSUk6AzzPd+OkNUNVcQOeFToeNd4oOAlB84hqV85RaktIikWHoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8248
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 6fb7b9160fe648c9bc5b4d36a6895b66:solidrun,office365_emails,sent,inline:4bb567e09092942c4d35489a1c7aa303
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHeIo3oG8uI3UFYTkpXaSGl78CCy8iflOqn7xa/9AAMPN2rVdBEA3/LIWyB3cgT0hG1k1Ni6w9DJtlnHaSFnGKPrTkxRNTrYq4mMsyB8xadjgIRfqymFfJGejgyv5gMPowNjTEjP0KwgZAPJQSpZBvFvQoWTD9Tfc1x57dbAEktoqgfrltmYrSQ8E3aRL70IagG3nS3K3nJjdsNbALhg0SZHLRV+ecDxmFfgCD68cOM2mAHRoWQxHa8vgkoFF0MnK4XlhOfHjXvesNOqvLOGdC01MB1UdrQPPzgIsBfbMfNvT2WLDs5SK0DRdZp/fYcpCqq7w45LBYzpE9j++2/XpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7gJzOyqbs6ZMw5TPwt3Bsxiu7V11lFiH7reqaWLFhM=;
 b=PNS5HjPbYEqrcosU8N9HL+DDpCN4MEcw5dnUUopIrN4Fmo/7NiuHfboTXzkm5cu3Q8jBF2mODK9rYrdJfIWwq4spXLUArkTeWDMjnetlJ6h9JLxPbFTRl+VRV2chgPFYKTqYP2epOH7o55vnb2c96HRgale1lJbYUWoNu0f+cSqSa5FtoQn5KOQue/a1dXZccaZHV2IOroFO+QU4tCPDQ5MQVNHpT+wx/bM9HMZPbgidZ6lBtZW8LmOMm7Vq86rqcReMLpbf5uJLXKeaRY5whKXU8cJiiV1Ch1lpaiw2j2uMAXE3tyy++6wwqRC8DjxZbMvqDumdn3g3xLWYAX90MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd3a35e3-6f18-47d8-6247-08df08e8607a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|35042699022|23010399003|1800799024|14060799003|22082099003|18002099003|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lfBvSzRGj4fVWCXN5qC4qtgEOvMIqVW8WiSPQsKUCzzSRcsIWIzqqQuIkb3+6zQIeRLVNBpGPYlz6iVKvAV4yTkwkqI/+lO6vVMHhkYpEap14LFTSDmuO2ljlKbhmoHU9RKCsP43HEyjZizBiogWCelYDiLPTvK/OkeWNlmpivXIKXUCZtOsGt+czTNxhc3ZrFAOwnIM6kgoSzH40Z2L+FYPE4RxKeY1YV6JKTFTmEekycDPUfwp57Sq0ipcX41Y1y8TZWl9wmawtm1pimqORGWtqJzFrt/N4Quf2zvbpcWsXpAFI9ASeEbqJ8b+OKDG69q9KW7E3Em2IQgfGaE+tnupyARfaZ+sFGm1bVXuTwS+RGV5bIrR6jOkT60uK3pNFmQBqwpy0NXPPphD2kanRNe+Z++gCrLwlGxEG5Cgeb3tglndm2nwgSf2dvKsMq4ePw5gsru4tgy8FhvEqieRHh4X+BEv79NUATKzepIG1drn8DG2jrZlBGC+EJOz1FJqSeuTl7BOkkl2U2SmanNuKxZjsiLjN8qvXLl0/qpwU4eu6n/YlsLT3g1Ag2XUc5e3aCB90vV1XKC0c/IKNMaULxH9ExrJskOuGviT69jWzzf+AGtFj41vvFJrGaNJgJDs6edUouXE7qzFC+SfbQPe2Q==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(35042699022)(23010399003)(1800799024)(14060799003)(22082099003)(18002099003)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TazgiOVbsLEgxzmLfRu9O4vzsb01ZPt8rVZriyEvh/LFed417RGy6xoAu97rV68qv7owwasSVWUwVy82MGuHJND3aTNYHdOUnxCx7DTnibl8flg7K34ENg1AxcCz/MIGWDFb2Jwea8uBgSqiHOYNjw1opovwBwUMXgHBrGmMQfgezIPFigQlaO1+O+1WpHXyqL+LN/R33X4drZYkVYqiqFUYbclpOwbPeHNrOwTdAZPRbgYdv6pvbYAGjdL4c3Xd3aIOGucbmXp3W1TBNhHS0EJQ8vEtJTCCKdp1Qb671JSRtQlIrAfcHSo8g/FWT31xl/2aCVFTH+iCJyFyVE6AwdiBXgoxdNf5mHJxeUTuOl6bfOAgrHXjkDpHlzrq5hblNt2BZbOy8tzh4Q6nKqIGUt30oB9eXYcHDoOsgNODC/tzO3RmNuS5tWXSzIMMy3xe
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:50:37.5526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b07fe41-a20a-4f42-f8e8-08df08e867bf
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12057

Add bindings for various SolidRun boards and System on Module built
around Renesas RZ/G2 family of SoCs:

- RZ/G2L SoM [1]
- RZ/V2L SoM [2]
  (shares PCB with G2L and has very similar programming model)
- RZ/G2LC SoM [3]
- RZ/G2UL SoM [4]
  (shares PCB with G2LC but programming model differs largely)
- HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
- HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
- HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
[5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
[6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
[7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index eeef34e3d7d07..1673005a3d930 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -508,6 +508,14 @@ properties:
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
           - const: renesas,r9a07g043
 
+      - description: SolidRun RZ/G2UL based boards
+        items:
+          - enum:
+              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
+          - const: solidrun,rzg2ul-sr-som
+          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
+          - const: renesas,r9a07g043
+
       - description: RZ/G2{L,LC} (R9A07G044)
         items:
           - enum:
@@ -519,6 +527,25 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - description: SolidRun RZ/G2L based boards
+        items:
+          - enum:
+              - solidrun,rzg2l-hummingboard-iiot   # SolidRun RZ/G2L HummingBoard IIoT
+              - solidrun,rzg2l-hummingboard-pro    # SolidRun RZ/G2L HummingBoard Pro
+              - solidrun,rzg2l-hummingboard-ripple # SolidRun RZ/G2L HummingBoard Ripple
+          - const: solidrun,rzg2l-sr-som
+          - const: renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
+          - const: renesas,r9a07g044
+
+      - description: SolidRun RZ/G2LC based boards
+        items:
+          - enum:
+              - solidrun,rzg2lc-hummingboard-iiot   # SolidRun RZ/G2LC HummingBoard IIoT
+              - solidrun,rzg2lc-hummingboard-ripple # SolidRun RZ/G2LC HummingBoard Ripple
+          - const: solidrun,rzg2lc-sr-som
+          - const: renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
+          - const: renesas,r9a07g044
+
       - items:
           - enum:
               # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
@@ -535,6 +562,16 @@ properties:
               - renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
           - const: renesas,r9a07g054
 
+      - description: SolidRun RZ/V2L based boards
+        items:
+          - enum:
+              - solidrun,rzv2l-hummingboard-iiot   # SolidRun RZ/V2L HummingBoard IIoT
+              - solidrun,rzv2l-hummingboard-pro    # SolidRun RZ/V2L HummingBoard Pro
+              - solidrun,rzv2l-hummingboard-ripple # SolidRun RZ/V2L HummingBoard Ripple
+          - const: solidrun,rzv2l-sr-som
+          - const: renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
+          - const: renesas,r9a07g054
+
       - description: RZ/G3S (R9A08G045)
         items:
           - enum:

-- 
2.51.0

