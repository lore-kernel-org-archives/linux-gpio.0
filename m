Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CED5452AD
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876672; cv=fail; b=NrT4ZZsKMwCsFW659KBhHQADuC373iTDxq6PMah6VyenEm/MXz10F4VdsSUrmqgxE9Eg0wWKZFKTVIkYqmgpUMcmEaZCgD9sLt7lL5wDGvMww4SjDfs2zg7+wLJENYOs5vC7bWyYLHWt1ax/zNHVqEwgC6xoUMRoN3xEGjmPCdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876672; c=relaxed/simple;
	bh=cX+C0EKlTTPiaWAWXp8KjGgmxL7fRLcZpTuoNyXGc1U=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Om0DSz5xMqedrMBX3acB7i95ZboC0Wjg/TdfJdGC+T6GeaAUnI/btZG7CGumg34gxUjbR9K+lkvFr7989XRRODvGPSblDK18LynTclBU6aLacto+s2vnRh+VJ/5+rheAgf5+cC5KLXSHXbimVC8zryMM4L23NgttUVI/5oUfbJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ICjiQrHi; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ICjiQrHi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpiT7erk1joPaulKuPQ2VeRd6rNXmShs6BPVi1O3xTFnEijYx9kjCzfQ6jKQfQhX/KLTP9xkN4NSnbXRnDjiOK6RfBFDLFj1eoCiol7DTqj3rP0VoEuG3xfmnC3wcRNd6vG/IOX8r2N4y0Fzg2kISC8gjoqoJw5+/oBDXWDVw9gSRV8PJXWrxNZZjSvvJp4sEWj7KN4UlhAat4dzd6kurXg0rKB8IcMZMraWmP7QfVYLC8ob2A9Yd9p9iReyVf8Xl/fsLmuhHUrsUqXkZC4LMwxSgBxNSURTirIDhOutvrIWl+laeLBr7upe+UixeiQwNYqgKwuGknVBqmIL0v7fqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cX+C0EKlTTPiaWAWXp8KjGgmxL7fRLcZpTuoNyXGc1U=;
 b=F9ro+R3NI/l6SKFnaQdz1Je6H8h7QGSyAhonIozGOtzRcCZe3TIAUS3bQOErXmjMrMYKWzGZXfd+xrVcSIBB8QbE9FKirTaxfr2XYDw5YIX774XUFBHruL4UFrfZwpbPcU9Y6G0zYNF+nEN9Z5MXrK+iUoo/1bebJ2Q2wWlG9vIIbZIDYRYJIn+MBdEGSNFfg5ylt+KusGuRfR7GU3ENVQGg4qGdk4+vDKZPinJs68RdGOxxeoBN9OmtDdxdhpWEIpY/WJ1deb0npEbe+ptUVvfrXFDMXwS0EPjuwCgWGG0MaUGkp1qvxnwH+nXlPFnuXzsMEKHZ7v7PqpebjE+97w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cX+C0EKlTTPiaWAWXp8KjGgmxL7fRLcZpTuoNyXGc1U=;
 b=ICjiQrHiiLwNmhMKHU33haw5RkvNtjBFKt5+exaQOzKRDBrdW9JxYWjZLc7TwpvM0Ki22Ue34a3+J7SGMIdmuAEz7+3r5ck9bweVuTEYPcP9pd+UC+xv72dYwePsLose934EbkGNNdaNJxKMkOVbnciYjqbkeAKSUkTXGIx/wcz/dmtMwzop+BFn8IwjCeLBKokFFlgWdOF+MEU4iTGeKbCs9f7F+d6q5EPK3HIqprPQ0N6yfvUY4KMDmqTEM5Z7wb/4eIjdSCtKsegdOyk19FrT3vi1/i7BV/AUHlkRwLEvkt6KF5R1fG2JcV8F3CPDQh9jzCdUw6XSgtgpmt2sbw==
Received: from VIUP296CA0010.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:34f::11)
 by DU0PR10MB6368.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:40c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 14:10:57 +0000
Received: from MI3PEPF0000855E.eurprd05.prod.outlook.com
 (2603:10a6:800:34f:cafe::8b) by VIUP296CA0010.outlook.office365.com
 (2603:10a6:800:34f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 14:10:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000855E.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 14:10:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 8 Sep
 2026 16:16:23 +0200
Received: from [192.168.8.15] (10.48.86.45) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 8 Sep
 2026 16:10:56 +0200
Message-ID: <280f27a5861d4b7e34e92c66bfb8b76548920800.camel@foss.st.com>
Subject: Re: [PATCH] pinctrl: stm32: Drop the nonexistent
 CONFIG_MACH_STM32MP25 from the STM32MP257 default
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, Linus Walleij
	<linusw@kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <linux-gpio@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
Date: Tue, 8 Sep 2026 16:10:55 +0200
In-Reply-To: <20260905080235.33785-1-kmehltretter@gmail.com>
References: <20260905080235.33785-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855E:EE_|DU0PR10MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: a49bbad6-e231-489f-99d2-08df0db30091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rXBUNjCec+zZc88rXNBhwgK4b5rLdYypbknwcCX73AmDNKAVUPpY1BrTxKoXB46Tr/RPRIfFzefQaqdrqo290Dqc33PQQuMCd4yY1+XVitYL0qyCCDuv4Y8ublvNC0D4DvK9MQX1GohYBrWNyWM5Q+qdIawEQBEiWkATQXCuQ+DnNHV70hVYBk63R7g9+Yg+B8lGpH3k2bCNfaecI+vWeVdQPhNnoYeTmKVlvEjvmoYBgvaVxXtosPVp8zWhszo/VdVTDai7/qJPPyRLoVhSUAvkvAmyDMCnmSrK/eQvU3uTCZ851vzS1aDCGO6NkQUMs1PLgEwJCuG3pCRLSv1a5NVhnvSYuSjUdxbN9Bv4xiJyeqUMSMc7v7F+qUw8bu1lWofyhrEj2onvuJtNCXlf3Z6MiJLzGmTiQYAs0h1i6KS3y+zSQDiyc9r4jBREFU8BSFPoNVQAElhYbsOPeg1U19t9N/Adl/TQrAVoTjJ3n/EGLVTbyqAd8JbQjDHjZNcxqva3AvY5VU1rM3hc9zEi1veH23Bh9eIVENKxfdAJyF/6uL4Ap+QgC7miYkfRZmoLfOixmYiRnLWTlCvr09q6o84cRHZRsTv+1qJj4Fmfpk9NxEcoGS3Gg/MTBdrtURUJZbjc4QTbYFqltUy3WaQZfMk/V1t5Rq/Zk0DVRz8q57F+JNqHghReHoSmgxEYbVd/Na/PxUQH/VeZbxZuXLfBkw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SnrAR+5p3/XHVJEw9rrwTl+v8WtGrRuQVaqTqOPg/f3QKu8tEYSy1kGC24DY39X7wAmm0HuMuqEHZerv8FawkJaDWX9wJL4jPAjJKaxblRWGH3UxBpH/tTW8LQeUFrxBZDWY6lGj/vvVTZdGFMT3Z36P+1uViBw6TVQjfpld3UbRMYseEJmcJu/YmGZgwgeV1i3g5Y8PnpsbfUwRFkaii/bGS7f434qxMVcbaeYCCYQafvKFFA4T+gWZqVMyS9FpNSVlIVrC6yqj7SR/udEy3r4KQ0lrNp62rTCynZuc/KafJzrYV5uADdxezK15AvnInPQEYKSVbWyA8D1jWhGV1kH6O0vBL6ZlJXJeISydLlMQVN+2L/AgjVDsXHwWHOFr07skZQ8GuYeQbYe2QeieqP5QohoGkT5C4y4RTbJjlycvIcP3RZLlnsMpec5nGYZJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 14:10:56.8973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a49bbad6-e231-489f-99d2-08df0db30091
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000855E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6368

On Sat, 2026-09-05 at 10:02 +0200, Karl Mehltretter wrote:
> Commit 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
> made CONFIG_PINCTRL_STM32MP257 default to MACH_STM32MP25, following the
> MACH_* pattern of the arm32 entries above it, but no Kconfig symbol of
> that name exists and git log -S finds no Kconfig file that ever defined
> one: the STM32MP25 family is arm64 only, where CONFIG_ARCH_STM32 covers
> it. Commit dba0aff2b89b ("pinctrl: stm32: Allow compile as module for
> stm32mp257") added "|| (ARCH_STM32 && ARM64)" next to it, so the first
> half now evaluates to n and changes no configuration.
>=20
> Drop the first half.
>=20
> Fixes: 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> =C2=A0drivers/pinctrl/stm32/Kconfig | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfi=
g
> index d6a171523012..cc425bbfc996 100644
> --- a/drivers/pinctrl/stm32/Kconfig
> +++ b/drivers/pinctrl/stm32/Kconfig
> @@ -55,7 +55,7 @@ config PINCTRL_STM32MP157
> =C2=A0config PINCTRL_STM32MP257
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "STMicroelectron=
ics STM32MP257 pin control"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on OF && HAS_IOME=
M
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default MACH_STM32MP25 || (ARC=
H_STM32 && ARM64)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default ARCH_STM32 && ARM64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select PINCTRL_STM32
> =C2=A0
> =C2=A0config PINCTRL_STM32_HDP

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks,
Antonio

