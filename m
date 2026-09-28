Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023107.outbound.protection.outlook.com [52.101.83.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDA34E1C88;
	Mon, 28 Sep 2026 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.107
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606426; cv=fail; b=obLsmgEQW0prjPaeMnCMXtuQ+8PuiLYtrflrzm4dmVFwP6Ngw5LX1Fw20M2dM8x/QvqQPM3zH2rp5WKNtC1Bj2QVpLjg2JwUh9DrAH6iN6I8O7hp83qErWTBdAHpkHnrn5xZDBHFU/No3mUyLYTFcOjKj3yHAbrMcJ3+M05a7gc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606426; c=relaxed/simple;
	bh=DbAYcbvbhbo3GiLPgZRbQUmu+hx3IzJXAGHnC6by7ek=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=moLkt18Zys9yLNZ6eFxQ57Xbr2XzlKFFdvUjZ74ePV9ldlWKYeTTlKWthu70yqaBI8pxXZDphaZhBa5qo4hztTgzlMXsTabx2ypeXTMs4QfvRr1joIuDB5DuYljTX4+KC8t554h3aUFd8A0cWaIou8v0lL+yfL913abZu9JjRdI=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=FwIDCSgM; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=FwIDCSgM; arc=fail smtp.client-ip=52.101.83.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="FwIDCSgM";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="FwIDCSgM"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jEnZoASSNXqcxO4ZEg9UrGhyQAhZ1FjmRhztqcwYKZWW80plghk93p0l7oa0R7k8d79YVK5ySTGgsios8E7CYnC/8G8p/vgB41SRMxY6Q5M8RwXgTfwJWSigc0iiTZNpnMKKE9ue//sj4ugUk2ec5GQJ2aVrydnwiYPhXZLhQHuhKhxkPy8hEJpAJv14bDlN1x+vDKy3ShBlk3TAlOg/HmNaUYn0rVtCZV+3n1Jw51LrW2l/fAt9HA6YVb6dOmSMaoBXcWUkuEp6OfUYadlVrub6fF4i4FuMWaxWusAhKS86zJihgtEJLFrtAcaYQ4uD8OzUBavhs1OSRg/wqNM1DQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=qS5o57i/jqaxhyHnUkP2nxOUTdv2Jb7FEID9jMBsWQtqqiD5GsZCggZYJJYxDfr+SJx/x78rQbjAjToQPeQ/06/KqkPO1bkEVCbu/+Z/MaOyfN1qu6K/Vx0bTib+Zsj56u2nY+3b6sg2U/EosEtXXi+3yMWNxcXcQiYBQmCJuxH+LB2AnKoWTZk+lajQb04HXKL1wN2hR74WQ47mGe/w1gvmiiNBXfYOyOy4xbSvNRY9xY+RMROUsyVxgskvMou1jQB2oCXkAGf08H+kgL3RZMJPQXe7u4ZnXOLXTSG8EMpexr5zRBVSCWEqYmHIyQT+e9jNxk705qN6xr+Ju6ai0Q==
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
 b=FwIDCSgMLUFZAxkduZJ/gSY9Lx28Su6P33YNuOgFYWoJjhzVKY3rT/zVtjgQ6aoy1oXTdon0F0LblyOoXcF4cQNVfjX6m2MwKdAPogL3Wy1MD4hDDmIRiw3Iew7m4Or9E8rPgCibvRDbdTzWc9LvdBa8QDXfLj34d+AIh701jRQaq7W7LNvF6TJ2+JcoLQfmML74NdsneCT8uwQxWEC0E1xNA8US0XqzCkqdS9zoptk4tK/Q5R+6cO+ErxRVQlVr3YhzREOI36K1xbcXcqTeNsMxnfjiPer0Rgx4uUlgsI+MzoGOUKf72x5wBRekp1RvSGjPGg+Qf9a4/SUZUwUiVg==
Received: from DUZPR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::9) by DU0PR04MB11257.eurprd04.prod.outlook.com
 (2603:10a6:10:5dd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:40:12 +0000
Received: from MA3PEPF00000408.eurprd04.prod.outlook.com
 (2603:10a6:10:46a:cafe::3d) by DUZPR01CA0080.outlook.office365.com
 (2603:10a6:10:46a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 14:40:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 MA3PEPF00000408.mail.protection.outlook.com (10.167.241.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 14:40:11 +0000
Received: from emails-3581547-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6A4B180521;
	Mon, 28 Sep 2026 14:40:11 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790606411;
 b=J57gtb1vbiPQWP08kmsIiL4G+gI0V6sdFmr2FNBF4Gx22lkj22Ev+xxNJOqs9sjldQY3G
 0hV8iLksisxgQEQLxLvydicjoDDb6br7Bw1cpKrtU4HnGTSsHHiKK4VZkvv4Csut9QzNKFV
 A1HLy33YDRLxVL7oYTn2J1W4c/o1cyE=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790606411; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=dNJT4c8uduIT/k1WThOH8GE6qw//8h6JOw3V7s9ykXpP5etL5m+O6y4uH2rKLI8I1/4mt
 8T2cDcI6ay+dGYefdrwB6HR6jbsvWLbUw4W7iBWkOWT2c02E33CAZ03UyjXUzXP0AbABiH6
 +BtDGDa1296qvKbf2fd+RqabhJFZygM=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=FwIDCSgMLUFZAxkduZJ/gSY9Lx28Su6P33YNuOgFYWoJjhzVKY3rT/zVtjgQ6aoy1oXTdon0F0LblyOoXcF4cQNVfjX6m2MwKdAPogL3Wy1MD4hDDmIRiw3Iew7m4Or9E8rPgCibvRDbdTzWc9LvdBa8QDXfLj34d+AIh701jRQaq7W7LNvF6TJ2+JcoLQfmML74NdsneCT8uwQxWEC0E1xNA8US0XqzCkqdS9zoptk4tK/Q5R+6cO+ErxRVQlVr3YhzREOI36K1xbcXcqTeNsMxnfjiPer0Rgx4uUlgsI+MzoGOUKf72x5wBRekp1RvSGjPGg+Qf9a4/SUZUwUiVg==
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
 14:39:52 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 28 Sep 2026 16:39:31 +0200
Subject: [PATCH v9 03/11] dt-bindings: usb: cypress,hx3: make peer-hub
 property optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rzg2-sr-boards-v9-3-5901e0fc9e44@solid-run.com>
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
 linux-gpio@vger.kernel.org, Josua Mayer <josua@solid-run.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
	MMZPR04MB400504:EE_|AM0PR04MB12098:EE_|MA3PEPF00000408:EE_|DU0PR04MB11257:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff2041a-976b-4449-788a-08df1d6e66e2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|52116014|1800799024|376014|7416014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 a5Mu8iWT4olS9bbCwerGfuJdD/b4SZ5gImOjvK6xn0X++4ulMCjIeYrvAAOmBdFxT+1+/zA6jEXvFd9pqAHjdKI/pFyB5vsi1cjVgChlhRkAI86JiOkShZV5LQ7st12pnxRQTp6vZPh64EHbx4TpwCiqCNBZsPWCL1lCSI1pgTI8CXmwha7oNg7NxvT5m8lMNVhqmTZfNB+T1Pz33EmmaEWC3rchR6iQa/YlFMxN2OsWfKcsYBZbAgDtGBq69hJQd7eJddDz7+Fw+SIHECvAJmXFHCka77J5ikTm5g9GDCO+p7MWnXM2i/nki7asxBinXbVmoiXbxf7w9ADuxKI8fLspcolAD9X+8EFmKimaKH7hyhV8kvS60iXUKbRy9Y/C6MorzjWZYr5rk0PJusLILCCEd0dLP4CcTZbXTFZihKVl7rAVG1QLig2/5BxJvbGbsegTmULN7kgww5kLfPmJ4sCQXP776cg7gjiZgIpY284TGX2OofACJfs+mbd6hr6xE+hCkhTgAEVAqCqd+6VfR+5GZKV0I4ZyhAwmV2uSf9JPwbfDIMrDxFIOvSPaz9HXTLQoMsbKLx62SCeGuFsGHul8gKp/rgmbzgnsy5U1BU/8kW8Q8Cs902sGxwA9PHtonvZWHZBMhdyyhx8gbCnojm2Wc80gMK6reN20Aq/q5cY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(52116014)(1800799024)(376014)(7416014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 5ARFFSgRjb7lRfoB5saTG/6EHT/2z2uAQtDAajqozCYxcE1QNiPeAuFM6wuYx7mkxO2MQSOH/7J22g9zBzdLObanhIW2Iv6sbcjae/DdAykf55lu2RADSu+77PadFgjk6AMTYw1mGypqsaO8LebOOAPVppLZqPVOeANA8qUfn8XqdghCxaYQVhjAqOnU1RxoMQ+Rrm5QjMrjRPEyVtZOmkBqAQk3kwo8kf8yxsex/t54cdSugfachIMLGRDWI+jI3Yq/s25WeQT7q2hLHHEEGEFmQQsQMof1+gvLruDtUZ+D3B8KYyqlc/wwBxnspsuTjbNioef1Ec1JwMkXWxoZsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: bda7d93f6b804982b3d89c6c96a1fece:solidrun,office365_emails,sent,inline:b64c0170acdd4b7dbbc6403a74d81bd7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8YvrcjtiHsxbBJLe8fAL4WUQTO6WqRUzGIUOROJksxyxsndllY67N4Xv++5OFj7ZJw15VtEgvpoYr2MOeNSP5kCsgZC6EjpK4AdSAp7ad/LqqCh8d9NI10v2d521oON/wFN10Fq1fBuHczRGf/twOfh5nSCAJzkQUXqdToy2jVSI6sTCPTejoTjcSlVEcXnQbGx9pGrYhrddA/utc09rfUqpnrShLkgQSc+bXt/NWnxWzQP0bFGlWEJ2UH2x+EUSU2OBA+IilNaqA2nXXu/uryAOyXtSHgR+d7k92X/fTU3LC+NjSrg/NLTfetB8pNxLseVWrhYIjMJsE0/EiUTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK7uYHgPxOoHTNGuOZGXImH8iGRNsahbB8j+53H8Nqg=;
 b=YMiICtIdl73eJq1LF88H/P0boZb8oNYCw6EjP4+kq8bkWS05Jpx8EObAI+wPWOkzdSCrAN9x/TdoPW3ZzyJ3Dz23YGilbbTeNAbgv7+ECR/ylRzTzzFDA5JX2TK6Om+0+EzsOKHfq7bQ+YvxOGIRuTxFwg0ZGdAnIGrVe38r96F/7zFWlcPoVo6uXrzKto9/xlZrcePGHhdNRtYFiROluvGVnPIcwJRjjWyQ/5+r4EOlYTF5OEbc9ukYpUG5latgDy/77cYWE08qXMmupPITLst/xWV5S/B5S1z8PLotvuNHlW2K6iIgsQ7W9yCItE7iYbaUgacXWqfkAhQhuEROQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MA3PEPF00000408.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f68fd46-dd80-4e0a-3db0-08df1d6e5ae0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|23010399003|82310400026|36860700016|7416014|376014|14060799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z4u3FyZ0w9ZwWLfZwr7aF6O4RRuLOKPHmmwqK6N7tcD8fhqikr0OzdJCB+fy67Q7wcN/tpYiHuszvuL3PWlcci/ulcpmxTmDEKlg0XFkyL7Q+81D14TX0+2HGKATnIaRn5PgczIMocvL4WeB4TZhmyb2mLwxLBAeEmoU8yTzohtRfR6CvZo58vGcbA8HbKvI1htNAnQZ8Cug8ygf63sGRb1xsq45iCJCIDlh/3QgxNqGORqgP3DSApfeTqcBNeqzv+SgkCP9OXpE21HEzZS3cJ0LH9A2Ql7iJFz+75FvJNIGdbM88CLOtH+m3IswhruP2YzC+fO17kVwkDeL3aHhOubshCv30zHDGfkEoz0gUQg0+WK1XsrZlrAFFfqeGC1KCAMojysXRpAe0WhA/TuZQTs2NoxhKctqQ5c+zgpFnSKzBMZgaijxcwGUXkNjMw1CJF/AxYR2xofHnbUSxrGK/KSzvADNRe3OoEzjTlndVREsDIvN4tnBFdYerxSm00L0lHWVB2SqMrSaG1E/15ZFkNtPN7xcyrRP1yqlpqq+bc3B1zs4vLnMvoziipyVNY6mlhWuvpzhDmJYAmIV69UTD1O0HXfpkC+YwEzxg0o0say5CJAn2TS7EC7uG4zrhYyqpfvzSD4L0RYq7/N/KFiFRxyIb+1SHgRy8OGN5d6VL4U6LqW16SIBQaRXQYQERi7hXbTq2bG/EgMmrIebLtIIcQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(23010399003)(82310400026)(36860700016)(7416014)(376014)(14060799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5pBq71tSXTiaNG9DZrvgJW073ti8/3PgcYycB8WDM+RqqdliI7JbNEg+RWp55kEn/mPOweP9ja1ss0TE/fhbrDm5ws59vJXID4w/N1ifg6NixNsS98g9tFRuxiVJf34mOs1DBf6rweRmj+3qdgEhGS0f7+Qk74RMY/gX7v93+rH33bX7OWwiiXpNsIUpidTaqZiU+LI3Dxo7oVNay+jYEKZXoIoJnRQMw/TigGTQcS0EcQppoqJidmOhoAYgvNLsZ8L2uodlk9OK6+odQP644qmtzIRO9x9ExYFAXw2xFGl91f5Olss0nXsmGephboUxN+BJ6fDvY0+2tV2m191KhZn4GZ/IpiYbaKY1/JcXQETGTNW57UoFbVDxPH7fVoqnud5/uLtdZfXqjfDq8fN5HCXM1iqYnLAJTGrY4TzTeVxwfiBAQ0BPre4wCNcl5zFP
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:40:11.8255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff2041a-976b-4449-788a-08df1d6e66e2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000408.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB11257

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

