Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023138.outbound.protection.outlook.com [40.107.159.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFE4EC673;
	Mon, 28 Sep 2026 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.138
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616865; cv=fail; b=eBu0RKbmM2980SjJVSaTzDD/Z6ktcu/Lhd4J8Qxk0kr9LrjKpQN9JwEHeJMtM7Qn4nefG/Gvgzm1hA8Mebt8iAGgPclAH1V3Sh0GVD6pI2OPr6DZL43H7XyIgFAzus9iBsaCGJKat+S0pJyTUoQVk8yLL5XQG0B8aQmIaFH/4AM=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616865; c=relaxed/simple;
	bh=/EuEBOVLqQhOIAN8r3KDWBwYjyo/TsV+kutweUCj4sE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Zav+q+49NzyMjtHckPop22XLHqLDai7dAxnno2GXyckml0TnS1j1sdAwexL/4Y36138THfo0zZI6G+sII3opqxZah3wxDsM7lSHgGUDwGo5vOqVZ9oFg+/AbrVDALmMDmCY/lrqYpW9F2Xi8fchuHmgcz/VCLYCVsm5wM8pk3zY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=dU5vXKfs; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=dU5vXKfs; arc=fail smtp.client-ip=40.107.159.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="dU5vXKfs";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="dU5vXKfs"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fudfyXWKVJqxYXYYtKWEtcfWGxcUiI5yr3kkUvZpol/4UdEfozACSey3i2MJbUSiBE0nE8c7xco3h5UEWiBNAmZ4KZ7W6rrvJGbSIk6P5Srwi0z9N4lHGgLk5uKSG6rKwKG+Kw7Dggh8oHKEXu3AG/dx+sj2DzOffM55xYmCZZ8HnougXkckxN6KY0tqJAEmasJe19GwmI5PA8L3qZIxx3wbW3uCativMir/ycQppoTjHsTsiAiKytA/j5QVlFwKhG2KZsYqarPlYnVAl1w1sqrdAeWGgM56sGT2M9ruW86mO80dzPZ9D2m5058P5fkR0Wy9PRDMU6fk3vV86eZoeg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=Gn2UPhGhjJklgZZNZFhSDpgbCeWJuTGJjp6W68DveUo+aipfx01vLwFN7B+x4rzjSS0yUsh9IS3UQXLW6erB2efznTD/F1JnicHgOUtCd/NoV6YGL2MW6K1z8qIkbYDtzSMnDGFfArQvh1FhRoExvN/8xJqt7sGC4LLZ3eVWirjWTKuugLITUMPr5ErYPLSmaHMG9iQI3nK1mZ8GfK1sEEhLmlGlML+UwUy0ZaOcj0el9PamOkQg3tgfK1zKCVhHZ7I6xam4O40brWcrXKCMFsukIedGAqNDrX9VRq96DmpIUPw4Ue7QHnggIdqEzkOcMtgCXCy/We/BkPgDewa7Gw==
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
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=dU5vXKfsCQUrWG/0wGSO4txHmGNc1mAkz2k1N3sa7T8hiZXzCVfIW4mwgXmfH52efkAevnZDnqlZYI1eP1GgxF5J8JEh/nq/olz/mcf3e5rnRPkeXw/XcT7EHzn3yI8ifHE9brrGx7hOotRU3kgLhf43w8fZQ2UPDauv6iB5GX7ik8Ossf5sK+s1tzpafDlkz8rNv9ZYyu0vINtthlcLAxvIAOpKnkHYxQwwEm2rn3UrSzdNGtFl5fldy3G3IaS7Uacuvf991Uy1Rfs8tWiROWGc35mQ9m3pXuwxWLxz7drkHlb5y4dOvLoG0+q3Hjvbl7rqGL1b1QOblWYt0ZUqDQ==
Received: from BE1P281CA0461.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:7f::20)
 by PAXPR04MB9490.eurprd04.prod.outlook.com (2603:10a6:102:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:34:15 +0000
Received: from CPH1EPF00000526.eurprd05.prod.outlook.com
 (2603:10a6:b10:7f:cafe::89) by BE1P281CA0461.outlook.office365.com
 (2603:10a6:b10:7f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Mon,
 28 Sep 2026 17:34:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 CPH1EPF00000526.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 17:34:15 +0000
Received: from emails-8794723-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D1EC6805E1;
	Mon, 28 Sep 2026 17:34:14 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790616854;
 b=erF6Jehifow5LpPZbnrx/ztxBacRYoQlNh9CMEl/wPnMMkfAJ7AlnMyxoc1PdfReGlaPj
 OIYVHVrqTfzLA4buKUjvaYsgsNUwU6rXLsKM3BecMpnodDlTE9rB0PAey29dRXgE1DfRZse
 FdG1Nhtwh3O8Vf9YcwDLVqbzHi0KEPY=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790616854; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=j+MPeGHYVYya9RK/Vus+r1OMvXsE4L3A1VPvmln4Zao+H8w5KLSfUlty7wwiRLYp7niYj
 6Brs0PKSKhmpCzAlIagi6NaeVV6OnS4sM8zwBuMMyZ9wH8VEpONjaKCe3xvWuxdK+NVszvs
 fHmCt4f0r67LGHZzNATo65ZdzDS0kF8=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=dU5vXKfsCQUrWG/0wGSO4txHmGNc1mAkz2k1N3sa7T8hiZXzCVfIW4mwgXmfH52efkAevnZDnqlZYI1eP1GgxF5J8JEh/nq/olz/mcf3e5rnRPkeXw/XcT7EHzn3yI8ifHE9brrGx7hOotRU3kgLhf43w8fZQ2UPDauv6iB5GX7ik8Ossf5sK+s1tzpafDlkz8rNv9ZYyu0vINtthlcLAxvIAOpKnkHYxQwwEm2rn3UrSzdNGtFl5fldy3G3IaS7Uacuvf991Uy1Rfs8tWiROWGc35mQ9m3pXuwxWLxz7drkHlb5y4dOvLoG0+q3Hjvbl7rqGL1b1QOblWYt0ZUqDQ==
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
Date: Mon, 28 Sep 2026 19:33:58 +0200
Subject: [PATCH v10 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v10-7-91752ea39cbc@solid-run.com>
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
	MMZPR04MB400504:EE_|GV1PR04MB9200:EE_|CPH1EPF00000526:EE_|PAXPR04MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c25f45-0286-4f7b-2db4-08df1d86b7b5
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|23010399003|10070799003|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 7MWWzEEoRpXligURiFVds3Z1YZxu+kSULib7aSOTIRdoNX77/SpMY4sDtcIUIw76L0V/pam66bDK/wLHxITqzNOqXPAU0/1mx9I0fcu7tUwp2Vk4Ip0CO0LmfHR06H4JWmbyBlK223cUv+GdCVykoGpwjQEcs4Xdw3f7S6i5dOubyT6hhJDJnk6bgbzcAAtMgKDEvTFH9LWb6/aVoEsdj9ma/on/ZcLSQiTVR6iiOH098xMIHqyeT6QRTdY2MkS0jjFKiaQIGDEL06pHLJ+WNShGPHFHFGCwF8aiXxJA64/olpVauODTS2IYYGaRCkgPRLNVOQvKV1GaaNNgHFtRFYlUC/O7JmhNtR2x72ZXmp0nDCr0Hje/IY/xH0Wsapt1Q4UkNJvj1yW0u+l/6HNZo0FmCqGFDWTaaPZL5hf/afG6bCjXLnbFU/m8AfQbkykoaYcxHjxCXRrhBugj6UktV+UcSIQRvyR9rSq7ImA2iedcBRMRB4WQRBGwNo/PbvdCvk9eAVMEJkZeXymh65DY9ihoZN+obyS5GL8km7jKhAfX5PTGy6SZX0Bn7jw4rss1l4HqX7/IpYNxybKJCj9Q+K5DrYKB0s9QS+dISM1oguISDi1eshrN8uuKZBER77VN6vDy2niuLfI5kxmvQw0VXXdpzhnFz4CMqv+YrogrXgs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(23010399003)(10070799003)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 K52XwN0WmDsRFpDkVrNIIrNPLEaESf6SgMfUxCatalG9TtFzktI775giH0cXgCxWGQ+LFuGbENdMMrhpMs9216LEE72tnOyZdHuFRiwMOXlmVlHDN9PoXtc/BivjueR9DvcvQaitGyRUqXYBX7+2EEEj1rpMeElwDstLc3MgC6Z6sfDgj55ABrmY9sS4KRT71YQd8h38zz6vEjzE9rRlJVPoV066vR85xK3xeG/ijjTHaSR042kHwF1RstIRnLY1aPkUsx4ji6Ns6C4M92M8xkQ+Qpf2/XJQ8JAgqN5AGYTc+VBl4aZOEtQvSueXRMGDDHwp7mrGUtkbCUu3EWwX7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2c4f9c5490894927a747d39c5efe6ae7:solidrun,office365_emails,sent,inline:87287daded720ae2bc7e73491d419f2c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=min4Mc+2KlQ9sHmNox/czbt1gwYtC9xPLNQsNzCQrKZ7uJsTJXzR/kTHR21HgKqWb4AZqcPch+wNupeYktVY6t1KWf2ryERVqNHKBgeWXtS9JqOVjd9nGewfEeSJxoRrq6NdIQXLOT1MecK8EXK8FyVcRqONUbNGzSxAH22/afoJ/Ew9MwKTJ/d64x0Rye+Ebc83tYJFoEN1XppfEbuL+eXV/88Urwu3toA6z1LkCdaujnJTpSm7vMx7lTvp4ImDuPHTWg5XNpuZtvox78whfaX/05H9uq9n5XVR8Zi9wstZwNaSqiIFPMtnvnSR8j81MhwoYkvh1s/BX3upZhm4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keNgnHsjc9GLnHO5r3fbEqDmvZ6/x7GrmWfwpGO64j4=;
 b=RpQ3bV45On9KTWZpJrXTF6hLvEVMpA9DqdV9zO2GS6L872h7Q1vEYleDc4B6OVWDz0pwl4ntiqu+5rWuZRxA4I1neEPMuI098UQ8isaa2hgyRd3EcbhyxmK6/FPRtV2A7Y4OsJUz5dkkcW4CFXAqJbl6UToBEjLlHzy7xV8S7JT26EGNQu+3DqFodDtUay07ef/8ULxhEuK41AjRRehbCIpYlLskdyXHkNGFtnJgav8PtFT/427lEnFPT7WFiNnBJWnnVb23jogOlnIFyJqlABRiTmKZ29AQHdfgVgtOIAOgx++bAxbeS7HbOvHMAnX5rJQ5fKN9sA6oHuBDpniqvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF00000526.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae800130-4e1c-4de0-abfd-08df1d86ae40
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|14060799003|1800799024|35042699022|376014|23010399003|10067099003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Lbskc0ssssbRoomajcA+Er14zJp7H3Yttpm+DNGK72QAsa+wNMCAry7CzHnz4QMJz5vjZqrsEyB2YJOGy6tKDePGJ30fJK8vJQRKrp+BZ9zEc9kP/J4/MXPE8YqLzxidwxAW1SeT4PDvwcbvElhPQu0JBPyLOiaHvX7Pw/5AZ49aYfkMIGICi7GRPNTj7VvK5rtX8NYfBS5pMIwfS+G9fsXRq7ZPv1uTdS5eKrrkkKYav3NVXrjsKxNzsD7uRCK3q1m2O8uAr3rkTcWnpi6mYEruE6VPZdRtLXacAKMFazV89NOAPa7/OrMBxwFE9GLT4HQW90Hes1E0xe7ptf8WAtPgMU5lPRvXw6ZHsIS7miQM+JTG3aUKPBoyERUB3LKvb7z1peQ0L/B4iJiEji06XbNT6jQLR2ZPFBrQ7KAde5ZR+/7i3eFR/F/g5p/aPjpKKN+/oJh1j7Z+QGvEgYNVYfKjKrnlVSYRxxoO3tFfl/+Scb+NlAK5doneEFyAR45tnU6HHtb2pW0gkZ5qphTBYc7NdWnPWxkHwZiQHX8YnjRZsXuhRV3seaLkHi17xJGFZKSASRfhzLC699pnYIUaF6fqvSqJBIQKr86O8k/ZNQTuzGZ+SRhQu1wpwm9KDJw00W7vIaaRd+Kn8JeskpC1dH1u6MBEpfd7K+TQ5NZj2V49bprQy4Oapa+UB6eltpnKkzQN0etDgsPYbCtocPetBg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(14060799003)(1800799024)(35042699022)(376014)(23010399003)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/nHb8jCAbafAb37TJ5NO1ooy7z1Z7hZ0bW2oGdg0iORRPmdxmvx5sYjzopX4YfNnz890kdWGB1L07iQu+Wjl7hfCWoV5FoioKSNz/QL+n2oB6VUNybyrPwOWVB01RovwjBwXKR63Ofrt6DLltccgLvorZngXK0OJwr/BBo6uwhmC1kbkzHWQHF4u2d+XRBZlPfEylaUpvVCWBCWZTp2fFFrx7jyx5XGCqJdMXrW+sesBr7PCpDCFdf8uJJc586sD+ryZCju8cW2zp2itjb9LRzkO+/kCkzQx79I5+vTm6NkebE/CpDNUMtpaDL685oyiu2rwYpIFbOfHh6IMVbdOAvm7Cs3PRegoO14Kgymktspg86PR6GCl/Bb7D0DraSVs+NvpghqffGXH5aNIOVINGR0qdb3Hxer2fRHQ7grUJbqhP92wV8SD5hKlc3bgSqIs
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:34:15.3314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c25f45-0286-4f7b-2db4-08df1d86b7b5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000526.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9490

The SolidRun HummingBoard IIoT features a DSI connector supporting
touch-screen displays and is usable with RZ/G2L, RZ/G2LC and RZ/V2L
SoMs.

Provide addon for the Winstar WJ70N3TYJHMNG0 1024x600 dsi panel.

Add the addon in Makefile for all supported SoMs SoC targets.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  8 +++
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso | 79 ++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 69b1f75156016..0bc2bbff9370f 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -170,6 +170,8 @@ r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
 r9a07g044c2-hummingboard-iiot-microsd-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
 r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
@@ -186,6 +188,9 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-emmc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-microsd.dtbo
 r9a07g044l2-hummingboard-iiot-microsd-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-a.dtbo
 r9a07g044l2-hummingboard-iiot-rs485-a-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-a.dtb
@@ -205,6 +210,9 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-microsd.dtbo
 r9a07g054l2-hummingboard-iiot-microsd-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-a.dtbo
 r9a07g054l2-hummingboard-iiot-rs485-a-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 0000000000000..f8584c473fafe
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		/*
+		 * Touchscreen fires short active-low pulses which level trigger
+		 * on i2c gpio expander can miss. Trigger on falling edge instead.
+		 */
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		backlight = <&dsi_backlight>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+
+		port {
+			dsi_in_panel: endpoint {
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&dsi_in_panel>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};

-- 
2.51.0

