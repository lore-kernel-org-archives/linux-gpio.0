Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D9EEC3
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 05:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789968531; cv=fail; b=h/dCS/mwpa6dFNMVyQ1IrZBUhoQEOnu40z3GyQL2dfWVZARlh7FcdrM8C5GeaGDQLHqCmv+D1S3GqhnObf+REHlyKaU5peqi6Zl48Qv7CDSB38IPs29oxv78dDNY4D4SewOQfxf+qVcm1opn2HMsI6Ld7VM41eHcdzOax0EzAtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789968531; c=relaxed/simple;
	bh=xUvEfXdNm1Hu5I2+jWX9nDmC+MNSTfYcIgccplEsSt8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qLZLp8hsSHnGxWizLWX2LlRTE8zcALStWUXsJ14YZwlHRLWvZSICJgVG3WFzVPgJ2pJ5zON3dk9MZ4hkUErbGFWjBfpmSr1W8pGQWRHzZsbk4kNaTLza7XOBG14peL3hnLbPfyVQWVas8/PN+iWsKHadD2Ct+o0lj9o0JdSOxPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2kBl1qp/; arc=fail smtp.client-ip=52.101.61.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2kBl1qp/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lim0rqBttFFDEkMEo7Xjt2rilXbtBREM0+nsWr5nNpcKjZbmqcrdleN4AkIr9R+mEfaidnXQpHeq5agvr9rwBmpboZyD0cURhMb9njJW7q4qS8vxU+zQ/plgNbgZNi8gHcusNEKVzLviGFHYwp5ILkx0uTK4J37QT6MdQS6ZJwkbLyxLglEA4YFhfKh3K0VVhAZuydVzMVFCIFCYv3nk8/aw/XzxVn65MuZrV+d3KSi/bvOxSL3veD5uJ4PMgGt6t5pEs5DFZNBr9MvDEFsypPx0AA4502a1khh336ilchCzFa2F82h42Z8CQ1bQkUweFlOPSft4kSAcIo/GnAa56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmV0f5EKSAIeQGZVvWiz8AAaiaxABep0rW/gB1ZKmwY=;
 b=GzTDJewZvULMA38RSeJMtEpQEG6yLH/2PBefP9g7tPtAjwi0sxBum+cqCgbKTo8lnNuixtaOMDwvja87GTaKtLtV6/MGTp/7b8BGY1h+ffcf1vUF9TIOYovfgOhgtdhbD0x4AJ+l8RDJ0pwjSEfJMuRLtuWRWSqZybvm28Tls72p8vdc7eqsN1yXd8RhI0RvZU+p5RNOAWA0WrPy0el08hm0nbcLeoaeNEP+A5k1eajiwEiU56mYfAmxwiwqjsewrIQ0ZmEddnFgCTIXvDO0MgB+7LOS9ZQYmaUu4KuA/M4sVKGtsxn5zsXYH3+cEhG9JNR0/2nVThjznw09D09LAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmV0f5EKSAIeQGZVvWiz8AAaiaxABep0rW/gB1ZKmwY=;
 b=2kBl1qp/2hE7QREIQaYJhEcNtmYD+R1iRR3iMA/q8u0ZbnMsnj8V1q+sdoQZwJ6j+smCNYBMJvmIoVAOJi1+V3mhl1hARDWrWbteYWbqgHyPEQVjzHUNLZaHvpFA83Jvo4MFZFO73fi8g4OpdKQb1tzEvR3w38Trjv7fiwsAlco=
Received: from BN9PR03CA0736.namprd03.prod.outlook.com (2603:10b6:408:110::21)
 by CH3PR12MB8483.namprd12.prod.outlook.com (2603:10b6:610:15c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 05:28:22 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::5e) by BN9PR03CA0736.outlook.office365.com
 (2603:10b6:408:110::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.15 via Frontend Transport; Mon,
 21 Sep 2026 05:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 05:28:22 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 00:28:20 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <linusw@kernel.org>
CC: <Shyam-sundar.S-k@amd.com>, <Matt.Devillier@amd.com>,
	<Guruvendra.Punugupati@amd.com>, <linux-gpio@vger.kernel.org>, "Basavaraj
 Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 0/3] pinctrl: amd: Add Remote GPIO (RGPIO) bank support
Date: Mon, 21 Sep 2026 10:57:42 +0530
Message-ID: <20260921052745.1056249-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|CH3PR12MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: d6142f56-5605-4983-adc4-08df17a12726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|11063799006|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u0rn04jBjgykfc8rTOBQ4H3K8fr64ZOuwofPADOjYmwcjDacV+XDxebk5YXo9gwtl1+3qoiNnEj/BfzLM0DG3nnhGNY/67MMIGUfffi83DxmSK/b3Zo6ZL81wtHUNo3isnB0Wg/L5WfYn5vq9+BkgDQXdX4uMTEqfu44uIDtp+ND4A03FDWK0GPwxV6926cgjlYtooaCjbZYSjb1uoap/lpKrISlCwLtmhRi2PT9PAPS+32xL5n+p4u+subMIL6J1/upnC5qjMG/Q4guFgOyve9F7LsRSqGrguF4BjQ25n4h4upcpXRSPtNXeXGaI9dKzfAqwkidcE8g7+AEIUzmcAzUUNtDRMiFlCFRN4ZHBK4N/06NdPtK/3LXRNy6gzZKhMMEYS8TjlI366fpsnh+scRCovCr/rnIa8ZdkelV/S7Ybycz32JH9DzkW93QRzwrjPcTT6BE9z+bA94QS0/q+jBYg8dgGi2w5li136kqh2sWXyMCaqGylkGy3mKJAWFKoajsiaQU2UhptWq+eWJiugQJfQuZrT54e4mYCMHxXCUnlBcZvV88sdMlTfs4UHq4rWwlXeqyk13C/0eLAhq2njzx6PF/APPOfnyXYqFDA9LISGnCWbyP9N3cz71KsKJow1943lhDm8JrqRoteyG7k9a6frTqdo/xpUpn9x3M82jTc5PArQpjySsZgjZrrL1HcE4XHQpzaLlsk/vXdWo4Rg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AKXyrz5qFWtr9J09S0q6Ed1xcGSWQpRPrRAuE0LAOqauGTjz6yx9LnWwuaxbPS0Or6R1eAdaaJNGQEHA3hwiUHRRgdY+b5E4HeIXKDf7qUYQs72z8OlcJ/W/bsli2lmE6kP+9Oyg1YH/PhAeWLdYnDuALUGALr2ao0m1+po191BHx1hjMUwvz5Mvd+XFninn6K5A6fD9KgJ1fvbpfnyIA/Fw9ijaAfM86iwQd8HyF0KR3GvTBmQI52vzyAozUSJuejaOg7kpaVa3DnnIeI1aHmbY/9wimWtjiNrzA87gJlLp2DIgkPxoyySsuZzhx3O8X74Rj5nWbE1AJgsMghpnv6NEhGQ8qtoGvdLpehVgtH5j5Sh4HeHgglv/LdNnuJlxrSBCWf1hF2yTScYInSaUIJxzqutzM0I0e++ioOPvX5t/79dZQ17WmxrMoOIxFo37
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:28:22.3495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6142f56-5605-4983-adc4-08df17a12726
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8483

Some AMD platforms expose a second GPIO register bank, Remote GPIO
(RGPIO), covering pins 256-271 through a separate MMIO region that the
platform advertises by name. This series adds support for it.

The first two patches are preparation: one centralizes per-pin register
access behind a single helper, the other factors the optional
named-resource lookup into a reusable helper with a minimum-size check.
The last patch adds the RGPIO bank itself, including its pins, groups,
pinmux and interrupts.

The RGPIO pins are registered only when the platform advertises the
region and the main bank spans the expected number of registers, so
platforms that do not expose it are unaffected.

Changes in v2:
- Rebased onto the pinctrl "devel" branch (Linus Walleij).

Basavaraj Natikar (3):
  pinctrl: amd: Centralize per-pin register access
  pinctrl: amd: Factor out optional named resource lookup
  pinctrl: amd: Add support for the Remote GPIO (RGPIO) bank

 drivers/pinctrl/pinctrl-amd.c | 237 ++++++++++++++++++++++++++--------
 drivers/pinctrl/pinctrl-amd.h | 174 +++++++++++++++++++++++++
 2 files changed, 354 insertions(+), 57 deletions(-)

-- 
2.34.1

