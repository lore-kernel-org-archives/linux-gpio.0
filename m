Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9462846C830;
	Fri, 21 Aug 2026 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304180; cv=fail; b=sXMc6fEJY7Z5zWsNjK/FbXI20VCYTKRy1EaDS7nj6Ivxvzy1/qoPOS7irejqjPzv4Uq8fi4otGmTNCLwRTg/yqfgh1jFtfqYt+7YVUSE5PlnZFtIN+2bIPtzGheLawslC5Lx5weDfa33MQDzy90REqOcbSpy6dXxo6I3qICALeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304180; c=relaxed/simple;
	bh=c3QAAhtL3DCYX+J+FVgDnG4lhkwd2FV1CW1w8bXGWJU=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c0q7dcLtNb7lRsyiHc9i/sXqnebNLkc7qYAwdCAFgueddiEUzPM9z3zoJy0I491DLJtjDG2UaaVBIzps5O3sAfCxNsTaQmezLItgsc7/5jXy2+b8XUA3kuNzj5shm1KDBa5RCz7h+afXyMTGYLaX2j0gYPTWFmsQ4KUJ1jI11Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=n0AKAZOI; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="n0AKAZOI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQLRTCpVXl18dXLfih00+xDVi1anpkmFsZN5XstQNo1gcDTffWd5PSjgAU5bqHBD2n5q5pUIyIBq0JyLZbeiplbSKXhK4KHcqNw4vVS27UvhbiK8iz6lIQaGYH7FNjKxdTe8gzltJLNMP3THR3U/vOMqxufOEnc9XW2CtpQeAPuKj74vNSq6CTW4r7xkVVfT2JtHbPJ+ut0reGwQMi6CChyHWIjzOltfp9gQY+LvpfEsnZPe66xFqaTLPytIfN9DEmVleA+d1arQYaxGaeWySl7yk9ZfPNKsgOyZwWfOMPt5AUx6eQi0OywqhJUGdDCzy0Wy5Iz6PGYYu6QxQVssvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3QAAhtL3DCYX+J+FVgDnG4lhkwd2FV1CW1w8bXGWJU=;
 b=ejg5dUMOpF6wlgPfaB7OIlF0MKv93SFyp18GT8PXmwaUmMsoEbw1jJWhjpugtgCknDPYhG9fZEsSY7+jTzvJ+mmtiGP+bwNK90R3kadDYh7yXuFrYlIgMmDXMIbJEU/E7DsZI6VJ/c2XCaSj+Q9cV60UyZyQjYWu5+xDKN9el/NHgmoGWgtUlr1/n0QTgos5rC2RjYrMRHoL6CsOyBVcVTZiAJwLOMr5rRo8wyIxHfXNYFHU0mGrDkN/Sb3lKyZSt0JD2KuXlrOezHZ11aUuiKRQcayTMb2pMGyynpxr+mzHgPtZhS9K34rsU8ad9I1J4hziVMu4nbgmLPLQz/0hSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=163.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3QAAhtL3DCYX+J+FVgDnG4lhkwd2FV1CW1w8bXGWJU=;
 b=n0AKAZOIK361/qp8N7zgpg1gzS5Ye97+EMtA6DEtM/3qENyT9lPvqyjFWeuNvoWYEEq1Ii+tIemmg3eQDANRw7rYP7cE3X+daQXe2E5k5Oesr3A5Qx1eQnXpe9LcqVR3zjaG7Rlmn6OdK12adHfFwVLkeVcf4SqBC0fQsUU3mIEY/eeFvdVWVsW6sbQeHEwD0GTSN/W1A+UQPW32HTxhOzVqij4tx89kzy6ObcJqf/HUwgbEwTyzJ5+93epXyDHh/0G2s7HHh3taWLanCnJM+nYuFR7rER3uqeNLH9AY3RVFuFY5JhcjmaKh8sbRiyLhWPriliT0h9drvKLt6hjjHA==
Received: from DUZPR01CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::7) by VE1PR10MB3887.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:161::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 09:22:39 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::4c) by DUZPR01CA0076.outlook.office365.com
 (2603:10a6:10:46a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 09:22:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 21 Aug 2026 09:22:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 11:28:13 +0200
Received: from [192.168.8.15] (10.48.86.45) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 11:22:37 +0200
Message-ID: <9b0f76a08a7c1dbaec4684b4bc013263e0149a4b.camel@foss.st.com>
Subject: Re: [PATCH] pinctrl: stm32: fix the unit of the hwspinlock timeout
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Ju Nan <junan76@163.com>, <linusw@kernel.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 21 Aug 2026 11:22:25 +0200
In-Reply-To: <20260805032843.36961-2-junan76@163.com>
References: <20260805032843.36961-2-junan76@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|VE1PR10MB3887:EE_
X-MS-Office365-Filtering-Correlation-Id: 387ecf45-9ebe-4f7d-c759-08deff65be83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jYhXf7XTC3vphwwyxsq6exnKBx6G+o4YkasEmM89ZZ2yLNujPG8nleIWUNZFW3p2IcSVGZbYrNOCs82Gz6c12tUok262fpxKQfZVtQ1apFvp/4EqRnnFLuaHZwjwtlbiCPt3K5oIexUUIVNUkMjA0GA85Z8YZNbI7516wzpWOdiXA6w7P+vIl0PvmiB3t0xrlRc1h/7MXwt84WlDELTjNaDpC2p/1e5o0W2JqHhknpy1ahPXV42In9PMV7JYdUhbFacvcXw1yJFAvshnbHLJcDQNAEzy5KGJu+wlpeEAgZB7jzmmWnOprapWo6VM3G691JG7D//Fu5SAERSpAq9HI4r40ZfcePI+7pfOiBewqOIoN5zzDCZbZhBAsi+rHYWYicDP1FVrVfhzIRX/b4tNj5yFAWBrRrxV6dvcZSJNib/j+Q7TQtqkbbii9l3Ra8DdL2P59bDAARxqLupJGvhrOe2EtdgM9MJqxSVYHmJbRvUgHy7rGmWo0pGq1GxYhkzzLtFhKCRHMZdOsFo+LDl8kBsy/cbDgqdXmQXRqe4ioXMr3KkF7ok2KRSSX3Ee/q0cNm5NqlAmR9MZ2eqglBiFamjpyF0pV26eIs1di/3K+FSHYvhwy0qMIHCU4exSaTpIBE/bxXrG3oMCWzf/Gv+zkNELq4ptZ6uCmc114ctZEIEzE2fMskMmDbjKsteSpGanFbQyBXoKKfF+KQM/jqFYDg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	haAoGnm1agbBqlWxsaQ6RMaKelZ9Gf5MJ6jqpWjJp61z+HV4NqLhz7YX1MauhQG3RVikUvkj3Rx+PwCEiO8KT4FtBnypl4h+1LCKmKOw0/brjbwQSUNig/VgJVX/srw30mXcC3xKWMZ51E/VUGqe+WYUhtm5QG2M8b0gcF3RAW9eLuF14eMsPBXHgmXw29gwAqZYwwkGMqeJtTX1pTFgqTmsoIOZfXMjQrX2ql2Nzxh1+LPEwK4bmUcwWd6JL/GWAQk0iEkvQIFt7Yp3tV7+KRO2tkgEM/K2nbNyhTx2W0v4m9d9QpP70dDqfTNihG65HdtlxXre7qNL16nhAYLUkdpxdlAX/oUyyMHvXTowub56fguQYGaBFNotJBy0AUu97d/7HsQprMafXzqGFvZlc2wqNlGG9vhSg62clBKmY/TwrfiPNAn5h7SKBq2UPAnc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 09:22:38.5129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 387ecf45-9ebe-4f7d-c759-08deff65be83
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3887

On Wed, 2026-08-05 at 11:28 +0800, Ju Nan wrote:
> HWSPNLCK_TIMEOUT is passed to hwspin_lock_timeout_in_atomic(), whose
> timeout argument is in milliseconds, not microseconds:
>=20
> =C2=A0 atomic_delay +=3D HWSPINLOCK_RETRY_DELAY_US;
> =C2=A0 if (atomic_delay > to * 1000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ETIMEDOUT;
>=20
> So the driver asks for a 1 second timeout where the comment next to the
> macro says it wants 1 millisecond.
>=20
> The hwspinlock core documents this explicitly:
>=20
> =C2=A0 If the mode is HWLOCK_IN_ATOMIC (called from an atomic context) th=
e
> =C2=A0 timeout is handled with busy-waiting delays, hence shall not excee=
d
> =C2=A0 few msecs.
>=20
> Pass the value the comment always described. The core retries every
> HWSPINLOCK_RETRY_DELAY_US (100 us), so the semaphore is still polled ten
> times before giving up, which is far longer than any plausible hold time
> on the coprocessor side. A timeout is reported with dev_err() and fails
> the pin configuration or the interrupt allocation, so shortening it
> degrades gracefully.
>=20
> Signed-off-by: Ju Nan <junan76@163.com>

Please add
Fixes: 290a9f937e5a ("pinctrl: stm32: use the hwspin_lock_timeout_in_atomic=
() API")

> ---
> =C2=A0drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm3=
2/pinctrl-stm32.c
> index 6a99708a5..dbc9143ec 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -87,7 +87,7 @@
> =C2=A0#define gpio_range_to_bank(chip) \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0container_of(chip, struct stm32_gpio_bank, range)
> =C2=A0
> -#define HWSPNLCK_TIMEOUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01000 /=
* usec */
> +#define HWSPNLCK_TIMEOUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 /* m=
sec */

Please change the macro name as HWSPNLCK_TIMEOUT_MS to keep track of the ti=
me units

> =C2=A0
> =C2=A0static const char * const stm32_gpio_functions[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"gpio", "af0", "af1",

Thanks!
Antonio
