Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023105.outbound.protection.outlook.com [40.107.159.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E224E323F;
	Mon, 28 Sep 2026 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.105
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616862; cv=fail; b=Ki6gYSHZH56Hu9uYrxyG2euGQ7KYdUYi6n7gCjPmu+ZtPcHPqdh/rCb8cp1ruZnaLMADT9lutKV4br5tS05NuJQ39Hs73o4ShiQ0I7jnjr36TutvyFFQUhB9mi/1CpwwHHgVUO9WH4PyKU29R3ZTuCTGANfntcUzpNHr4T/gr6A=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616862; c=relaxed/simple;
	bh=5jGoNYUWIz27KBbhO/ZCli0jMLasroOl57IFArc46Yo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fM0wmMd2HuFloxIgqS638K8V9Sp/kWvZAHwc1JYJ5xnltrnUl+98YBIjjzJz+BYRoFiUJyLeZ7NAxLlwLEOk6WDdJEmR/TdtE8M2f/NzKgq/S9OGgsa/BPMOEkFyyCmZrgTkhLoDv55CuFe+12YR82KXkQFO+LPBq0sU9QQstG4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=KBfwEFVl; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=KBfwEFVl; arc=fail smtp.client-ip=40.107.159.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="KBfwEFVl";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="KBfwEFVl"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BXCS0iUJHiH57NyCGFrt1UjgVTS13511Xtpg3/0CDLSGdav2PVEljIGEfxKCJ8agiUoS2LhnA54f+0EJWfcQZGEQa0FpwlzTsK9eJV1RJwpwvd/9Q8PWrAqdtMmXHX6Z4M9m73l5yxhtbNtHpH2BSmNwfSaJuV5v1ZPyyI+IDyT8v0lV1aOj6T/FCr8/OUcyFgoj0hD80TDysTzsswSa0I4xmPBciiBqGfpDpTT20EtyXO1uKPNDC1kGBYqQRme3EUypxyTVCldBzHSqiPCGE+a7I6EfGCKC6Ss0Bi2lgioxJFh5RpSEL48FY+XOXEGsPtHI/Msggu2y4DIWMJe98A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=IlSJmWu9BlJD5bxuOsDH7J/hNc01O2MosYtxVj/uTtv0BG0yMKYIIuJc5x3UaHmTrMumPyvfC6UsqVDDnN7H9KcqoTOy1EydNAsg1RueE7UEXNEc9vUygHno7YT4hm03W4KVJ+Tz1Jk6kMzDjVIUsGipdfIsnIuVu8d63ry8Q+mGJ2NvsHTXDd7C7f1iZh+gStfs4dyufWG2TpcD+PKBva3k+B7OrJCtOjEv11rrym4WdqErPu5pacsooEuYlln9ickuwa1WOWr+MIy1gypBm2tl13NzSal7F6PfnofBaGmTyBTjThIYGqJfqXZPWqLTvcUt6f2MwD/LbLmJAcISmQ==
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
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=KBfwEFVlDZ53P+Eon4J62PvyyGudcitk9ubF6OfIq0KI7+x1UbFeS6H5XrpanBlmOJiFfQnl74bctEqkG0JalThFgEAnsRDLOKdsP3Nq5+9qXDdku8M8U6F8g5J8rnTa6TDMYbTWCXFn7IMhds92He64fePgARJPUcfPpAiIYlnXPDiHGeDhCNndaBhzOek58qJleHSiBFolAs09fAKGfjjxFgA9Q6KESvKAaAGOjs13vrESnZaHnItn2IhzfXF/GnWh6jpz+/brwHXeXPJG+q9loHl3eLv8XgQZl0gqa4gQWWG5k/j7Ps+M87wHRnTQ2oMRp8tObnUCyEpfqqJhIA==
Received: from AM0P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::24)
 by PA4PR04MB7853.eurprd04.prod.outlook.com (2603:10a6:102:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:34:13 +0000
Received: from CPH1EPF00000530.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::14) by AM0P190CA0014.outlook.office365.com
 (2603:10a6:208:190::24) with Microsoft SMTP Server (version=TLS1_3,
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
 CPH1EPF00000530.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 17:34:13 +0000
Received: from emails-2570297-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B10F7805BA;
	Mon, 28 Sep 2026 17:34:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616852;
 b=rCV8xgg25eLGmPKAsuyqgiOxa63mWee25jTCfj/UCbOsgjM7EHzqsJM/D367f3WdcJ000
 7QeB+XlOoiac9zAQd5DreZp++Ocycoo3cKntZD8bvbNbixAXmzpu8w+5LWMjRh5bqr/WmNj
 ac9DQPmHp4CzBUUtMw4f+SEt1Nj9tv4=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616852; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=qngUaUa+tAZnV3T8vVAfX8agUfbs1M5z7Dt1gcXXTS2NX2QCHmzAuPzuSdPB36mGG3O4X
 LMqbZpfAKKsQMDw0W37SKxk7+NEUpftmaxy8Zwo9BStBdYgfzDy0sr4G4b7lD1vkA0nFZli
 ahZLxuj/Q1zH9EcqEYcuEEtBVNwwa/E=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=KBfwEFVlDZ53P+Eon4J62PvyyGudcitk9ubF6OfIq0KI7+x1UbFeS6H5XrpanBlmOJiFfQnl74bctEqkG0JalThFgEAnsRDLOKdsP3Nq5+9qXDdku8M8U6F8g5J8rnTa6TDMYbTWCXFn7IMhds92He64fePgARJPUcfPpAiIYlnXPDiHGeDhCNndaBhzOek58qJleHSiBFolAs09fAKGfjjxFgA9Q6KESvKAaAGOjs13vrESnZaHnItn2IhzfXF/GnWh6jpz+/brwHXeXPJG+q9loHl3eLv8XgQZl0gqa4gQWWG5k/j7Ps+M87wHRnTQ2oMRp8tObnUCyEpfqqJhIA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GVXPR04MB10045.eurprd04.prod.outlook.com (2603:10a6:150:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:33:58 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:33:58 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 19:33:52 +0200
Subject: [PATCH v10 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v10-1-91752ea39cbc@solid-run.com>
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
 Conor Dooley <conor.dooley@microchip.com>
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
	MMZPR04MB400504:EE_|GVXPR04MB10045:EE_|CPH1EPF00000530:EE_|PA4PR04MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dad2434-e985-4b2a-f59e-08df1d86b662
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|7416014|376014|52116014|1800799024|10070799003|366016|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 ie41u9wGcZ2rGSAme7Llq6Ki1VFPhagljQ1bVnS9VLDQvVmH0j59OodmTjLORhg3p4fKxfdgBpqD7WyJBDXUbBffsaJRr1hLtLDjtatziWB06N1iLs0l6oBz2/KT4vLLW4RJt0FRV8TyYhZRjzE5nF7gZDUiaXbTH5HsRiqfUJ54zYDC7A9M6emoBR6BPhuu0926ijTLFFytNECZmvf7NmsyeE0ikOkTD9wR+p5kuVWN7wCsKBLGGJkfXZSi4uFEuEKe2hTeaFnPdfkKTPqAa+VUrhmPg3i7ph5NjVzgbdl8kt6dm52txW7a6yhV1q+ZK08FPX/eskFFEEbkAjX9vRYe05tKoD23zBOpi7OTUA6t+D/Fy0UXMmj6qv4C+8eL58P/bb9/bX0boAW0+OLaTFcNP3CveYskG23vjPkj+cPs5kA/o7dnUjTiyVLYtESRc8rVzO4qQxegVcdwzE9fou4MKMlSZ1aq40SpmT4fBMNgFtbuolSH+ZJxC1wi965XGyUd9BPI94KWSfK47CnGN5G8lANkVVEHheFx8ZuMrKAdbfbP1df/Q6n2Y1WQ8oHmP1xz0bbL/1DhUVXXtvYyBE1dPrgQQVNQwetV9ACuKegT+Ge3p6iBOn3oNNn2ViTN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(52116014)(1800799024)(10070799003)(366016)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 y02m0Np9wi7Y+UmF1MaGvoh1zopI7hB8CMnytY92DrQhBaNkeMG5aPmQc/t54/cMPOLmxotvdL+pM7M+bhNk5LjFb/dDnLYr+4yDnk6z2L6SnfOYWS3/QCzfILngu2rzBr/t6dyMo9FsGeq55PH/FZLjJ7gzZ71wTJov73QSLtGJMmMDRWWUnf3havFNtPn9yL8WwuoSt5cML35l/ycOr0pt2vCzCquZPNOxXDpGo7i5BpvlBxxzBPSTuESd/dBIWiMX+5gf+AD58M2jdHJT8CRIOYu+4FiLEj2Xa8Edb/H02M8lBBUwfcZVnnlImKyYQnNJb5qjBuuugSMFBtLUBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c918f5b15c504a9ab815e126c092e00b:solidrun,office365_emails,sent,inline:585cb81c26c6c708ae2146b98e782aa3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhnJ1n4Ya6z6zYPZGiVsiF+kgfXW06EMnvp/f3Grd+IHPj83XQm1uegoRRJLa/hfZkctZsBeHX32FclaGO6zewR+JGSIWzxisCqxHorVWJxIIps8tTLCwONKe9s1MiRzOpvUhOmdbYcJgkwJR0DCIRO2dZJ0CJ3nh6u+z7B4upXOb6bh9Mm0S2OoqK70BDHOEPKOTYznDC7hGFJXvBxg1qQvrIOeenJfWFceCgC3doj75t9vMnCZlj/8xSgP4dy0qQUSw5WJHYtQMpSbfCESeLcdaughZZDXfj3eFLn99OBUpdL/p1wwAXXp6jC6O1PWPk6OvgIQcf8qvj2H5bN70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsIryudo0T/i131eM+NN7EHT0/F1UnJMhsvPSSyqmBs=;
 b=j1pf9UqlnlrpPbjnu3wA5CtXX7UzE6NijxCLEOuRHKtcE7NJ4sR+YsmKqQo4Lj76tqQJ5gGmTkapUQ785EuUtFqdzuXPO9PGIsjCo64+Ct3nxQxtyZd8HUCkm2PDGWZIEOm0fj8/KCv6htvvcqcbn4MUx0trinaRy8mPtawHEy1JnRziUuqa94blwuVn7fqQRy0MjGxPRYOHCKzx2HuSOe/zK3aRF+4QhqA7GSUmXP4qo/P0TDa8z7ZoL//C6iBogma5aeOGhmfdm9T17Di7tsEKdwFKjcuTsv3vrUSscrnnXS9MwA4a28jxs+kbGzLd13kqJP83PXwQdEhxU0YV3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF00000530.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd7122b3-d4b9-480a-b679-08df1d86ac94
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|35042699022|7416014|82310400026|14060799003|36860700016|13003099007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rrNMsvSyerckmR80rbGiOAsw99E5pNP5loAxAP0S5LDNbttxof7z8bES6vqmWHThGb0fsib4xAzB7qKcm/t0Aki/xaJowDY5GftzGeYXcgThH68922mULpc0Hzra4qTFCKSMJCodRDe4URGZ2P5LQHtrH4zgf5fEXwW/YMCB8II0oibA8bHegoLTog0mpRhjfgqcw1IzyBTeu5CInndxjB+nAZx2szhMyAaAaCD8/suKF9cH5WXHwKZBdo7uvTt4M9OIbg61aGvoZB9+5layMjBbgPkvjhGgpNANlIqdNEMKGM0LOgM0cT9D7iXj1CpDXIVbOgjWj+Yf/zxZMa86RGjy0/OX7AVFhjLDrZQQBmy0XCRJUyBTqb7WVgAmEmGQWXXQfBgA7zkEp+9vz+JNm4R+xgG28h85ltPa/jlspsvZJVSeOH48la25T0fV+ORoQC4swo33j/ePJ42ZONjSHlZjcmqCFrt2pWQQcNPEuKjwNiu6zKKg2znc/PoKJfTlNKpuInWpwqMKNiXBk9RwDn43V4ax4iUUdpj+L+PqGlz5I+oycP/bT57X62SOPboZmge1+cHI8JxeTuu9NTCVzdbS32dpsIHgUVqq0np/EcnXmbIJsiGBnaPY/XsreDH5UG9LBPEzhyDLE8mQEGh7nQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(35042699022)(7416014)(82310400026)(14060799003)(36860700016)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X9o6Y5+hBLkK14fCsFmuSifa8x//kjRgSAG5ZvDO3vHG6Z2K0ZuX7ViWr7waXor8izp6MDZpvFbTDNofPCWSCreZ0+EcKX6r8s030sTucDyY2f+paI1LR728GnF83pVzkp3jzsXguRKN14zDBwqalDW/ZirOYMf/ez0cAMXKLpMksctwUTvD9pXHjp5tm6drqwZL8Xkn4n3PFeLLRgKg4XReOKGoJ4w7G4xc7Hdm79lszOpdWv3G4drh/mCUPJ7N+pLR81iYkUMowb19DDL4PV1rm+kXOCUC8NUXCv2B7YzBgVgCesSeEqZ40dAtBfYszKrGpKtHfbKVebxmkjy5MTZwETi/fTEO+WJ6C0Sbb5S17rNkGsO4h6CYHnI3o+3PT4NGekKahrcfmBGpMMWKhT3i5HPOkRqbhvJz1d60HwosPR22ifcmLr8eIE+yv7BY
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:13.1172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dad2434-e985-4b2a-f59e-08df1d86b662
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000530.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7853

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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

