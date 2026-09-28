Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023120.outbound.protection.outlook.com [40.107.162.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89244E36FD;
	Mon, 28 Sep 2026 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.120
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606426; cv=fail; b=Cp4VMFIxr1ivPwAMpCvKi2eERMOzowI/hKSy/+k+JAKmxuU0g1pGwpY53RTKKa6LQK6LyVHbHWay5Oy4lVxWvivhFLAZbXVm2gFllrg1Z6etxVC/sGiwbn8nz37Lq7WX4jQ4EpU0XBisj+KXfu5cMWtQuqtdnfWHiTbSbWt3UpI=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606426; c=relaxed/simple;
	bh=uH0rrP0fNf4uXH6bD77iN8grmdsyC3xONM6M+U2R5cA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pykOTaOau6PeVBbgfS7KvNVLNtm1rVZib1XL/+R1H3W58RHVniYB3X/FxMN5eLnrwoIiuSIfJJuhh3lzMBGnTNZ/SvAwUuBT1LQ6LN+eaChag9hLMQdsxeU3iTQL1fD0jjiixGyVrfOTcuzUCbwm2f0XLVxp31BdJ8QgissJzEY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=SD5KRZ9x; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=SD5KRZ9x; arc=fail smtp.client-ip=40.107.162.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="SD5KRZ9x";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="SD5KRZ9x"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PsDbG1cZ8o37nhnU5RuM93lIkAzAX3DDNYJU0jadkUwb79v1YBhyB7hzicmmkkQwt6SabzZOkFiN8DeStB4h/uQ3LpmDwr45cYBBfmpGla23fB+SxFHjp+xeGHmKE5OlVEHh8xDZfKt+NyJK6TeebujYc71wCw5Cmrdmi7odk8ZOQgzgKlyFzYjWVF02jvsm2hAsQAs3y1+/Ne3buS5grps3XxLGM8JnBdXwdeZieKw1m9Ve1Hd5wEstnuvcTRdosRqpp8xmC0wmYjFYUimXNeg3JXhMknr6AxeWiIIdv3/o8ScMmiyG5BUEnHIk2jqFiukrIiVvkLKg7PYJ/go9bw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=Yfk1pwxAnCMlwFsH6XSLWFg6kCrfoZmBrATGGLEug40guP53Nxh4vCsVmB3SJBh0G9FL3PjmElZLRvL8cFsMlG7tF/7sqIaVAINO85qmb9Bhtmgct6VRMzsZ4kMooJamYsrFY+6O9jEpkoq495bqnJa3sRtkfWvks4PhLqSr4IcdN08hXEEsEc/j60ISdsT8WYsA8k4xxafEtz4vt43bOXNCCtfXZLQm0QI2LkL/N7x48z4C9i1TVLdDGdPGMHrTs9/KjGqHlQWDKaG11nM8rG2tte9rCWKZbop0/gBohqJxpVRd64YutQ0uy9GhdzXXtfvaDf4bY8NuiQugZag0Ag==
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
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=SD5KRZ9xEXHuEF7CFIMznAu+SlqmFcwgeWMzM2/GWVzgekoMIsVvBOBrNXGsEiD7O14yGUFru5QU72t3/EAQFWzxfqUnK1J1gztf/S68YdJOd2gkB5KR4+w8AV9zArUJEfFNMyx94KGkV5qHJPFlVpH8shH66tSUvDB9MZfs9/G3JVLkQdR5zVlfxP15D8xjcjB4gNOOrmEexGzixwJuR8OJqHeZ+9biHRuvpr0+oV9J39BBuQQU2uPtG5nyspEpb97OtZVH1jp2Nl7HddpmOv4QasPCzpbu6T+iwcT8E2zHhoPp+3J+VZlIb4HBSf8aaerlmrP8GqRv4YjpfRkCRA==
Received: from AS4PR09CA0025.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::15)
 by GV4PR04MB870460.eurprd04.prod.outlook.com (2603:10a6:150:405::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:40:08 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::9a) by AS4PR09CA0025.outlook.office365.com
 (2603:10a6:20b:5d4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 14:40:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:40:07 +0000
Received: from emails-7591953-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-814-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B4D4B8053E;
	Mon, 28 Sep 2026 14:40:07 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606407;
 b=A2uhDKNbo2uuGM1RyHzpnNYHVnCpj+0bTWYR+qpYGv/NG41gJ05JBNi4MG9XYqjfA+HAc
 CP9Vx7XKXbcLrrMIU5pNj8cfdH0lRuPuR+CiYi1CyQq0rem3+9ji/NbcEGYfQyLvm5zdhkB
 vzXOVhUiLR6PGpdGGmaz5JHmeDULQf8=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606407; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=csEZirucYii2P7sLtAPG08sh3Tt+LF3p0BmMTRBiIo8UzpzVTB8IjEUfZ+jaQ6qce0wQN
 PLOf76BKOmcp6i8JxoZj6kjjguEieBKWF9F71uL4UevGjUmhAot2h/loL3Gu/x13M987Jry
 KSORppaL3DxV9ZrKWaxEuKIU7ahFX+w=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=SD5KRZ9xEXHuEF7CFIMznAu+SlqmFcwgeWMzM2/GWVzgekoMIsVvBOBrNXGsEiD7O14yGUFru5QU72t3/EAQFWzxfqUnK1J1gztf/S68YdJOd2gkB5KR4+w8AV9zArUJEfFNMyx94KGkV5qHJPFlVpH8shH66tSUvDB9MZfs9/G3JVLkQdR5zVlfxP15D8xjcjB4gNOOrmEexGzixwJuR8OJqHeZ+9biHRuvpr0+oV9J39BBuQQU2uPtG5nyspEpb97OtZVH1jp2Nl7HddpmOv4QasPCzpbu6T+iwcT8E2zHhoPp+3J+VZlIb4HBSf8aaerlmrP8GqRv4YjpfRkCRA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:39:52 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:39:51 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 16:39:30 +0200
Subject: [PATCH v9 02/11] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-/output-disable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v9-2-5901e0fc9e44@solid-run.com>
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
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|DB1PEPF000509F8:EE_|GV4PR04MB870460:EE_
X-MS-Office365-Filtering-Correlation-Id: a413cace-6093-43eb-dc16-08df1d6e6472
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 ZTtY9J0cHIuvdUSZCS60GI8Nxrr6KU74GFNI4/mV4ov79hUJB35qx2GVvXmWkkgeRV7UXzOEIaMn1kGfF61b/d53qeergrA/agPys0Ws1ZHXjVIvnVfgUzHyQHW9vqKz+u7lak+JjCdyNKSorP0F1NEQJFdetHrpC0kD6Efs2swFbip9Xrpf9qL0w1rFBrHgppew/fKGtPtNHMkjxEIWEGkRNVCdHzQjSIzwqMiKPTr3XfWYTTjo+fDXzxpqlPEzdaCAHSe1QDfKdcWJR9hc/zNqrXgvFTu6U+FOw8pAQyy79GBtlSZVgbiGB2Yv0xX5hPhZnVmeIMSsa2PYmT/GcyUR2FZQ2RzJmrlSVN8E8l5o2xvxGcAGc7zMetQBqKjEAyIYj8RvOC61D2H8PhK5KbHJdQNNhE281gHaWzilvY7ImvmnwwPT3YvjTqH6RCDSsm+eHkcQEd+QXuGgScPebkmub8qEeBd3AQvRV0jlLpiXB4BYdmQCswTFN+gyGi3MyEGplQ/1FPsfSh0qhxlVmgNTUIh2RpybEKyvV8tuXBJTZBgQ/Yb+8/B81yZ80+dQEj7dz5TCYFHX8RUPVV7mE3nbHo5/eJJUWU8Qsk6+KzS9REoRy3bc/fIgPv89iiAD7rYpU+b1jzo1U6zxfxBthhGJPrryhrt/8Crs01v0Hcg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 PJuNsLl93PSl/A7dmMd/EbbmP+JZFD22iLtfHExTySXBA/odS3otrUdurfPTsjcvMojJzX9AxOXCHGwU8m56Z+le6nC5Dzuo6iIxbAbH/thOwtlXpyhYOFgHzxmReCqX+58DKBzgNMuZIpdU2shPtUH5MZ8VFbaOVtegtOuDSDzhgsN07/VV3dOsJoYgnZOpjigQ25esLedKdzIiMIhp7eUfLrh0femutBrblynf9JYp8JZRk5au/Nt17ZEsGC+nz9yMjs6PXebsgUdS+Tmc2MQdlx9v9v2hIlSFS3DLVNMSmUhJCZ+NFwDhrwVbKqe1eu2f4ZULK78QtLD8YQJlIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 96076e3806fd42c6839b67e83683b0b9:solidrun,office365_emails,sent,inline:ccac836d61caefcbefa3c2641c859a8b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg23pTqI23hATvguF/m5uSRSUHc0ujPbckFY2aI203NxaVhgrk09OUSqq1rc/ZoB331WvaBoe1iDESr3Dg1e9A/+kp9q9kPQyN7bNq/zAI7loXYpfOqGxz25lA734valouoJUxcdqAtkp3WnmDHIgp+QKZwPleRrkGIMzH0nzuLt6Bbu8Spkl2isKMB8Pl0AZI4nZLG/rwx5u6KXbZESGzlt+RlX4U7L+O7Pr4WK9i4qHSOLeBi1LMM5jpVvzbZyLTT6YB82qRPSuX9V3c8ieRBNjhGA4wdNvtgxDgBYvqnARK+5XkfGBTC47doOVxxqfAAQ8FBZ+zjU4Xg7HB1WdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5A+ZPl9/M86tQDKWf12cdwofJiZiV10o7E7RlytCxc=;
 b=mH2BMyO1SKOjYSHfL/AjQvB8/aK4t/L9CPM1sLJDLOw+Vn8sLSMhdyi9CISCDzclnCqWPttYF1cmkHM06Ly5YPn02iAkK/HRW7VUGC1RG0tNil1mmvEXc44R2ZnkkaAMZS0Hx7Yv6G4//y+zwV0FTQOZPxIYnWXVcraG5pBu9Ga/+zTnN57BPQb3qhpRE+I50ZvdBdwBHkX3TAcwbOn+9s7ajB64QDQZChckLysfXJsrP3A0KC3stjacy9EOYqsOKgkkz+YzCGwgNsMpP4bToFbIcQ+nUQZ9UDRwtz3aUsKo3ipdqwdi6K3ZZNcEW/loMkxBbsM1X2sJdxTzb5nKyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42c3466b-4900-4740-7db4-08df1d6e5a96
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|23010399003|35042699022|7416014|376014|36860700016|1800799024|22082099003|18002099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	otmHbz3V+QdagicEhFyp58k2ihHw4fehHFJZrSNvjZamSc63LtWdhZvyfjYJzRbOi9oNESyiOzvzGWn3yqEfuQAXbG3jZiMQm6Po0P/5SWOegjkZPx74PIlaJ4lz6GDUim6qe/fVBqlZDlQuhUD1JVZpbsguLhMF8YsxKPmHGuZAUBWrn/eiIqDbY+pzy5ohMOLbRMWBx5TGofVKvN2skCfTOQxmfXlEo5ktQQ+DycC+sUY2ut9OrKvFk3MksO9U8Cl6aUeKawy8dmc9UgkCpUuKtTC3o/4m2MZ174v3c8hXINcDXiGk3qYX/tNwTsDteGAOsjGoEk9jr9yOWSvdkzm87Sya2ifC/4y5vSrspeAKjXaUccmhgXA+gp1ine6nrKR9Ol+cbCwoge4ND24gjA9cBPR5RT4UJR1+L/Ycfd3Glp0BkhOu6QTZIUXpQh2vqSXdR3HAIcjKbYWo8T9fLYgys5w0kPKvlq5IdyTSXAa6jBcPB4liNIDMngfemzeqpwQLE0WIGAOFygkzLTOiPc3m8wzTdPQZoGoO+HwpngIs6yZ8JeaGmO1615IGtM8yLkW6yZ0l2VP7aTj0hV53Weh/TMubQ3pYRxJkcQn3U2NqkELagSYHXpsBEBVIuugBpW/fSWw/WUHmst+KNcHhgdyglAOo4WnqTfDQZ973NO3P3PxJeZw+mYD0JMGWhPaV7bNRWevn+51RZMiVe6gA+A==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(23010399003)(35042699022)(7416014)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lqR5NhfCtHtP2Z7QlpRnSPBclbvq9Rn957VBfqDu8f0NZcbda38T51G0hkVR3QcSzjyQsNlPD6Z4KrNwVBNRVSSC4Urxu+OoDjqoKT84V+p15qIFqQdb7H0iQpGkuF9jMDdL1AzXF4oLjsGf99rrGVYSdklGgePj9RF+QjDYH1VhhVMf+3fuqXvVBXV1LhXwr6NoijKmPFokUYru2jLr0cASscTk1oqTBv/oyiaB8ejeilnr0yREa8jQXzR5662UkZLIKBqtecr3RKLM9EDqYoUcsOvZlXNbl53hUhqFOrRF8J5GE13SrteqeQrzBTgd0BYHdKgis+RBvwOD2ncxICgX8E+0GqLvj1j+oLEB00Cs5SyVk1YGIl/+HAIZv2eiLxgIcmwhAht5aO6jvKbvH0WQ69yvxxUw+kImre4q1DYlEsU6Zg9iMwh67qvoKcmf
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:07.8319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a413cace-6093-43eb-dc16-08df1d6e6472
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB870460

The list of allowed pinconf properties already includes input-enable and
output-enable, but omits their -disable counterparts.

Each pair controls the same bit. Where enable (set) is supported so is
disable (clear).

Add input-disable and output-disable to the list.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fb1fe1ea759fc..a551996623c04 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -135,7 +135,9 @@ additionalProperties:
         gpios: true
         input: true
         input-enable: true
+        input-disable: true
         output-enable: true
+        output-disable: true
         output-high: true
         output-low: true
         line-name: true

-- 
2.51.0

