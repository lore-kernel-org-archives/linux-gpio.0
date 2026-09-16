Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010012.outbound.protection.outlook.com [40.93.198.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2614B66F9
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553282; cv=fail; b=HkltFofk5eAIy7cC1lkjJDVTAAj9CzpfDVApAhLr8o7Tml5Bqrv5LE/3n4ieNqakSfuCddspdrgnIvBpZPCEKOWr0LXYbUejBphJb4xp19KILhwyP2cUKiI5b3JkVaLfvzc3AWFuSvywIHIE50idZG1FDN52ZeHEeIDhMe+Fa64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553282; c=relaxed/simple;
	bh=w2rsFbWCb+GbVd/nlSfTzxyeT866WCPdQx/BVdmeQjs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AI3Rp+35DQn6QT22HFYuiMEADZzMlQFaXNuTnuribfQxTwej8bUKvXbiViAU1qIr4DnxCOaPnMPC8SWZyTIvpVnJh4DCwfQDH3GXmwDamTt/qrHLNdFskpn2kE7JhfaErdMzkrh9vd2YlBL4QAFw2/1cEb8tQim4hYVqZIIwApE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pzy1Yigp; arc=fail smtp.client-ip=40.93.198.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pzy1Yigp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdUF/Cjui5x7nOnqw/6Dd1U0pm9tgeqqCAZsUndg/9ju45sdsb8LY9QJhLlo6bhXbfc900Q/bl8WYu+afNsEPkXS6bTZ0cum5ciULNWxsObfdZ2QH5fn1xNTPkD5z0CIrMMMVdjmBuDFQaEDVJSxoatfS5bD+dj8nLH+QpHdQ0+VrfU/n0yWWKXmdOr3QYhOa69dmoYCDzrLhG5MKQUGA883ABUhurOyOlZ46sWfq1AjlA/ZbXsNyj7/Wmao1V2xlRoZvivJEEg8v7mQzw8omracQtCsJOCA/qHsBnJm7VB1XcLJksMEqeUMB4s+5dkIxNlpqurnp/vRzzC9+E0v5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKY6jhGd1nfta1MjzW/81qGMdcLMXMw/1uOzrtCtjlQ=;
 b=JX6raHF25e/PWYXYNn8OZ0ptU89+BfU1nkPvVuqX0Y0YOjdS/7uktpyz7IdB9W+I+c1zIgRAR3TjUhdQKpamDj/QVMuglPjjySsupQwfJi5kg7vFvPGSfqJw/QkT+vs/e4OuMzoMOFVrc/jpKnnaxKrXHAmevN7jeHzVUeM+duAfPMOLv3n1cnfXg48W/1IPTh9Z1+wSbeM1Ylt2Pdd2Z5IHowcW9lfpA3MBFMEROysTwPNqHQzLICxpkOBmGohAcd8Fqqp6a5J1P4VjeQBynC8t/z6BK1SSVvsqRXDLznq7+e0REVFXxW3TDgVV8RuoxLbpqa8yjYqZ0M+CS9/Rgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKY6jhGd1nfta1MjzW/81qGMdcLMXMw/1uOzrtCtjlQ=;
 b=pzy1YigpogX54gS7RDRB273RiYDtZ83wyE6V8WfYWkwZQ2iLalLZK5u3CQxfRmY7CR0ha0gjcaTeBNK5tz0I9NZkoX6K1UQRkhqdNbWCfNONV8gvl2Uk11S6E9GWqQBseS0x5n32GIIH1Ua3gGJyGYSOcUyE30g3kHdZVqloytM=
Received: from SJ0PR03CA0080.namprd03.prod.outlook.com (2603:10b6:a03:331::25)
 by CH3PR12MB8753.namprd12.prod.outlook.com (2603:10b6:610:178::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Wed, 16 Sep
 2026 10:06:57 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::10) by SJ0PR03CA0080.outlook.office365.com
 (2603:10b6:a03:331::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 10:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 10:06:57 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 05:06:54 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <linusw@kernel.org>
CC: <Shyam-sundar.S-k@amd.com>, <Matt.Devillier@amd.com>,
	<Guruvendra.Punugupati@amd.com>, <linux-gpio@vger.kernel.org>, "Basavaraj
 Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/3] pinctrl: amd: Add Remote GPIO (RGPIO) bank support
Date: Wed, 16 Sep 2026 15:36:27 +0530
Message-ID: <20260916100630.37849-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|CH3PR12MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed05dd4-81c3-486a-2ab7-08df13da3df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|10067099003|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	X5QRtL3S7xTinE+aqNFnAOx1SF3BGNkuXqhzlt3Zism+pWwva/ZyGry9Q2s+VnaLRx0hd1ZKVTLE6Iq1fqtojbNarFVcsZFQlYihfweSCW8qmHO32bpX8lZMNod3dmFnMF/5qBeDe+bcX6QMPGTJCUgbDiIKYOPjEZXqS5Bn33ZA78cSLxIkizKmuGXh8hEAOVe7yiB3qm7dFIGWapa/ZWPsYaTF+KDb9KO365nIKNlJm/NT4jB/PxpRSCVll4Yg5M2XL0Y0/n1b3XMI1vZ5BwqD1uzWFEQ5onR6rJ6659+g+zWIHgd01dElKbRnJwa492V7OlfQa2HbaVXkJWVUmQJqq7nXxGRSdXXzHTElcSN8B56vr1qNa02qzZ0BOrUw7ycRMT6lFZ123JXd0i6cgr2vbwlAJubz/fj8rMPfRZSRI6qiZZ4uhBvVxnshUzzIuE7EiuRQQckh3J5FrL7JPJqgnvYmQGD4rKFH34EfC0JD7q00xa2Y4lwNlpYriMyq0lfRok6/cFKcGood6Y2RspxVrPtlQqtayLBfFNjiDqHcERcE30SsQH9Lb3gkXMibbL4x5NGOQqhJo4BItlpEyz3J92GbpX7ZCQ8EOILIif5MFTKfGMn/mMLzJ48Edsvs+3G2X07cHMxEMWsdeOILpP9Eo2acYka5MjV/OA6c0EwQoNmsMjzuzpWO8HwDactHg/Byl0QwDPAXEeUwTfuJgg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Dj/LLCC6z9z+lo57p5re7A5rlXAofdj9bzEX7G3okfBUX4K4EqGZg1AH1ZPQLSB0+fzltC6j1vZUHU8wh0klckFRX0YSYP54Qse3Xq+heWqtwy73VTRxHKzGj8IaqOuBCH7UxgO5sS7SImOfXDiCD4qG3ya6Pk9Tpzb65gvO1pqL5MyHvIADyoVg0rJ4ADnOcL5oOfdm1/yg3YkUlgQcfF4vO+1by/tcITFi9028GXBHZAsx79Q/rw6J+rwWcvGi9/hMkc4Oy/M0UNmJ/dZFGDaPL5Mf4YhCahvtfMAFVkGZJpEho1imppYVOGzrACYAkMV7otFHe4fqw5xoLDhMG54BnfDC8RNw6rdTj3/MxuIUj27mveHO1NgWbvCYo87lmYAELbOi++kzdkkecJddB3FjPn4Fs+ROEICBrHEfG5zV2n41HvUed/rFv1cku9W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 10:06:57.2075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed05dd4-81c3-486a-2ab7-08df13da3df4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8753

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

Basavaraj Natikar (3):
  pinctrl: amd: Centralize per-pin register access
  pinctrl: amd: Factor out optional named resource lookup
  pinctrl: amd: Add support for the Remote GPIO (RGPIO) bank

 drivers/pinctrl/pinctrl-amd.c | 238 ++++++++++++++++++++++++++--------
 drivers/pinctrl/pinctrl-amd.h | 174 +++++++++++++++++++++++++
 2 files changed, 355 insertions(+), 57 deletions(-)

-- 
2.34.1

