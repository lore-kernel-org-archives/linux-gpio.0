Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBC813CF82;
	Sat,  3 Oct 2026 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791032729; cv=fail; b=s4g8KsjC5yvbdmRUxGri8bwyUrQB3aGlloOYtE1lfF3utkMMa7ypyoj27AvTfSm+Wrh9EMCCZeQQDg2UVPQSIqxmRErmAaxFNB5O5JzmrJDHPvP2WES+MNPPaFKBbzOSrLAQU8KKlNa7PXVYDK+Ap+IqSBZxKh/1J2w6x0TmkRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791032729; c=relaxed/simple;
	bh=jNHlfSVmnSrrpq0LJNJGLpWPgqTydryeeS/IXu63JTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sg5hg2d4HqoKF+EvdOfU/15wFxDknSD9/lvSCJgwfQfwXurx31B8a6Tnr3W5rsF4i2YoXg+V34fKwbD1hZD9VkosJknomumPXTCiJGGmQfI37K0jPuPYAwBFCCyDoK+OQdbKcFZDTbMOl//DsiZOWfD8dHhJVSRmQ//E7TNfk4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WpUti60w; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WpUti60w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIDKzFvGqiTtd465sIKAWuN3U31Ljq1qSKXBjXWH2WizuvrNw77tbMponcTcUl6oGOS1L26lUAMNtzIlht+XThiD7Mk1I/xYCBIQ9n1J/eXDNdmJkWldTrW1jBJFwlYO0OSWIO42Be6KTZsMECunVVo5Fvk86CusHn6yxkF3ntQXLwpJb8f05EKzewsp7kN+XDNFIftiaLIpEL+xpD8Y28al2psL4aVFuo9wsPMA9FDuw6GARx3R1j4Ao16o12N8l38Av8xi02G+wYJxDxAMdituJx9qjKO6Rp3M4c7QIL4YzDpea0n0K6CBKgyTchG4ujVHvS7NL/7QM4El6FISzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZF3j2gsx20eJ/Byjn3joRqgCKEfS7YfOS9Iu4ow5v5c=;
 b=VQG2gG8QpME0vev5pmXoSbM01m6PYlRSpP1Xv8w0juNSFrMbUIr700LNDPy3L5t3ngqJlus/odyCQ5lc58uTzZldBmLUZv2wvDlMpK4fc3DiMvHzolULdZXTDh7ZGJOBOpP9w++0vSDF8yUVg1uByNmGuArTubglQ7VFkTIPsS0zvEIiRpnlJNUqLdTDx1WimgV8UaIzvdxLGLLWSAvCY0I4+EtgcaVRrAdVydEwYj2rGRltyJ1TWv3CVCOnANpy1cVY6fTx1yBay5fh34o2zt1OSdrKP02Y4QwnbSn9LFFoHNDK1n9px7orAKqI4+QQ3kIpn9D20j6D4XcHXy91pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF3j2gsx20eJ/Byjn3joRqgCKEfS7YfOS9Iu4ow5v5c=;
 b=WpUti60w9ynJIeEkrWAznLJOD/V+KZ53cU49vq52f3/OcLE9PdgHiugdBr23cxagIELu+sqkFks+EXXhKCpvpr683O+vn+bA66qUpjdIVDYPMq/Zg6FKdoeOSgJ3B6RQ0n3CPylmAuCG6Kb2cPwHIGao+YmHlhxN35LWzmDHu+19CtE+iVlkaEyeLvp5BQXP4oLemKBPrWS7gDxQQ+Z6OloGn7V39GbR42DG0gzsSiVNMIVmg0uqTSP2HmX+0H0nQE2w6DeDqGdZ9ZT5jm62oq2fh3CMuE4JsrjenIjuz91kvVehCpQsZ0SdAQlV2TBAMlPSgSVrkdzgu1DCbdaYVA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV4PR04MB11970.eurprd04.prod.outlook.com (2603:10a6:150:2ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 13:05:20 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 13:05:19 +0000
Date: Sat, 3 Oct 2026 21:09:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Some fixes to address conflicts
 with fw_devlink
Message-ID: <asD+nBI+yq1F0MOP@shlinux89>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
X-ClientProxiedBy: MA5P287CA0309.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV4PR04MB11970:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3d6f5b-77c2-4cfb-fb24-08df214efa07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|18002099003|22082099003|11063799006|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bLWqv7avcyZ8w3N7FsiM/WJEHRibS3q8YvCsdukRk/K6IshaI2kzPFAhuzBg+82Dj1e/qkLT/bsVpE4rsD8BA9/tqJ3OxFxE1SdTPsf2zlCW+cfGFc0/DJuiQJAxCRMFTNVhedHsrlKvGOqF6k88BaEyAub14Zvu3VFCEHbKT4qhckfZPrNq9gzl9rEnDInXikR2GXDiQf0TOvap/LMCe/qum4ExM/VKSvwUXbuMPrc7WjZRtFjn3+LJKAgM6xrMZzQEx85yDtWhmQnF58OhtHjTe4zZjceRzRLur5Sx909+P4tu2vb08VN49uV8ObbArUk2pU4AzEN4j1wRoxPhITPt4mv3unKY1KjDKH/NFY+CDPxP5iG7BvuwhUyMhwfVQ1pDpEBENCUGhHOT7KGbTL1H8oaGqKod42tPpikoM7hBb7Vbd0c3MKMKAJss23HfISpeIlghVeCGHqURTDofa5OrVLwh+NHYWmOrdBUJWtsGqsTAFBoagGN/FknkBL2Wo7CMPkkrKgfiitAG/mFq4Md7EwUX04QINNGNkJTt0JH79VefGEgzM/SvoTWgM7zPIJcJ9rXNjqcb6UTthzn6Gjrip0KpA9gpSkSVxgeRz78RGCmn9x1Kt6ju7bA0os9sgJPcemx4+A53ENsNc2bq9V1p0J3w1/LdR446er0D7aA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(18002099003)(22082099003)(11063799006)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWw4T3VUbldXTkk5TUpCbFNaOGF0bnRyaXN6eU9uN25oLzFxa1gzK0NBQlNi?=
 =?utf-8?B?Mm5XNHhSdE15bCt2VjVmVU9oNFI3RUlYS1pUZzNqekQzTjVkeVJKSCs5ckZ2?=
 =?utf-8?B?S0t3YlhxbUdJWUNwcXFmWm1TMnFXVFkwU3BZdWNsYzRneDZ1R2N6ak91b2pi?=
 =?utf-8?B?cWcxMXJiZDViOGZ5blc2cWZPKzZ3eS9KZVFwYXZVVWQyWVhEc0tqV01HRWpK?=
 =?utf-8?B?Yk1nWk1aZkk3dDY3c0NaNFJXSkdnRkJhZWFOL25HU0t1VmtmbGQwUHJrN3pw?=
 =?utf-8?B?UkdYckV2S1k4RGpqWFByV2dFWEhLRlp1dVU1am9PaEtqWHhackpPbTNheFc2?=
 =?utf-8?B?bGJ1aHA2bDZVUUV0LytrbDQ5WWR5ejhEWURsY2dYdFlpZDFlZGtJaE9zUUpq?=
 =?utf-8?B?MmpXRFRpTXZtc0xOdDdXdEVlUlhVN1pDVWJYMDMraWczWSs1Y0NjMW9NL3Bh?=
 =?utf-8?B?VzNST0pSWHRuY2kyQlZQNnV0alVwbTZweWJmWS82KzhVTHhNejdoOEdmUVMw?=
 =?utf-8?B?V3l1amZqL2xUWE1TVm93S1gzQUxhT0xTZ1pJR0lEQ00zSmxPN2Vwa1EzM1Mr?=
 =?utf-8?B?amRrS3ZLYis1U1FQdWkxVXEyK0M1UldUNEt3Z0xiUFNRTVZJTDNFaXRzd1A2?=
 =?utf-8?B?K3NvZGtOWllNbUZ6WVZvVmdEcmdiRVR6enFyN1J4V1kyQzlHOHRKWUQ4dnha?=
 =?utf-8?B?L0FLT0pNcmNmMHY0ZG9zOG10cjFuS1orV1JuTjl2WTU5YU5pcWdLTVZyYVp6?=
 =?utf-8?B?K1gvNHJpUlZobnJUcTlaNXYxUklYUmFJL2Q2SThYTU1LRU8xTzBIQkl1ZTNZ?=
 =?utf-8?B?dFhpZHU3NFJDWS9XSnZTcHJFWktqNFlXSi9PRTBLSytyZUtHQ3FpMjJCOS9T?=
 =?utf-8?B?NkJoQnFETHBLV1lKeWVmazNCR0ljL3VHMWtIRDh1THd2bWx0bEZZelNzWW9T?=
 =?utf-8?B?dzN2YndNMTNyM2wyOVYzV1JESGNQeE40TmdVdUdscEQzeVdnUDh4dzFMV2Ur?=
 =?utf-8?B?Ry9Yb293b3dQRkpxNDdCa2M1MDcrdSs5TzdFbjR6SVdEZGN0dEdSOWRCRzI4?=
 =?utf-8?B?SGJYMENCT0czaDJZdTJuaFZRNjllMnpUL0dtYVFWRnFhQlpYSFRxeklhTURx?=
 =?utf-8?B?ZWFnRGw5dndseHBkcXJwNDBnY1VVVlQwakVYNXBRTVNubERkNFA0Tmk3ZjFU?=
 =?utf-8?B?TllHTVY0UWJnbmF6QlZtSFRRc2hXSFZCUjV4MjQ3WUVnRGp1RzhaZHY1UzFk?=
 =?utf-8?B?ekdUQjZjQzR5UUljVEJlTnBqNElyRkgyOHAwR1hUaFJNR0RiTERxM1B2V3NB?=
 =?utf-8?B?Vmc3NUwvdnpvYTg4TGxVOUZJMFB4L2RKNzJ3c00wekw5cjIwRk1JbmRYM2g5?=
 =?utf-8?B?VDVKb0lWUE5SY1pGa0RzYm9WSFNMQlFMbk16VncxeE5JVDhvOXhjV0ZtRmNU?=
 =?utf-8?B?VUp4eloxdDZuYTR2ZEF1WEFDTmlMUllQdGxxcGNSbE1UN2czSGFtb0RxN1g0?=
 =?utf-8?B?NHFleERaZEZNUlVHYjFhQmIxeFM2bFg0aUFZeEhKb3BMelNESXVGTkV4MEt1?=
 =?utf-8?B?eGRzZU9pOTZVTFQ5bmhmbUJIUlpMdk9WQk0zQnp2Z2grbUgyVHpoaVVFV3lh?=
 =?utf-8?B?cUNNaVAvcUhEVTZOTHZjZDUvYjRIdUR2RFJqL2hOT1hDdkJ4eEhpU3NpMU04?=
 =?utf-8?B?d1cyalI0U3NlN1RibUloUWVIUFZSK2RSdHJ4RTcyRnVZVlEweXZldjNYY0pR?=
 =?utf-8?B?enU2dUFaOHhZQ3NYbFUwZmMxT1F5WVFiODVmUmp2RkM4NVorWGZ1TCs0bFR5?=
 =?utf-8?B?aHVMdVptcmpGWENXVlhRbGNoaEFTeGxleEpKdXBhczRDOFVYNjY2OVVhSXEx?=
 =?utf-8?B?N0JkcFVkeEp6QnQrUGxtUCsxWE9hRnpnOHdjOTFORjNIaEdjengycTd6ZG1O?=
 =?utf-8?B?SzZKM3lTdjRZRWsrTkJnVDR6TjdZZjVsTlBRcmdVTnVJbFpxb2VrRkhFSHZl?=
 =?utf-8?B?SG9MUUwyOTc1RUxzQmEvekp6Vks1UkhLcGxWVThCcWhld2dNcjBTcTlvNEF0?=
 =?utf-8?B?enN2SFJFYmJEdDNDdHNOR2c3RXRxNitqVEt2SXJVSGJyczEzbG5NSjI4c1ZE?=
 =?utf-8?B?bVBUK0VlUjRKNThrYWdTeGhleWl5TjcyRUFMZVZ0andTNnY3cUc0ZHpvUmlr?=
 =?utf-8?B?dXBrWklmci93c3QyOHNsZnVKK1l5L2lYZ2JBUXFwOFR1Q3pIb3Brejl3ZmFZ?=
 =?utf-8?B?N3ViSEtCOElvRElrTEEvWk9uYlhlOFVVOGFENXgxeGZxTlV2OWQrd0pTUm01?=
 =?utf-8?B?bjhGRno4TlNValBQeGhEamNmRC9IMFZ1NnVrVmpKLzNNTUY5d1pHUkd1QlVp?=
 =?utf-8?Q?WmGxPgPAcDTpV5e/b3vJbSB/kWZQnHYUB12Ck?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3d6f5b-77c2-4cfb-fb24-08df214efa07
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 13:05:19.8711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ltaBrxvLYX4VhdN2UoA///30qO+iSlB1zdZ45T9vRdiDvgXcvPfWuDxg6KnJE+NV1bcuLLt7cMpPK609tzZDfFkvnzu6THUsSWEo9yDQiAXIBF7CIwc2vsw0cxrq+pf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11970

On Fri, Oct 02, 2026 at 10:36:29AM +0100, Sudeep Holla wrote:
>Peng’s [1] identified the problem of multiple SCMI devices sharing one
>protocol fwnode. His [2] shows the consequence: the first device owns
>the fwnode but does not bind, so fw_devlink can leave consumers deferred
>even when another device binds successfully.
>
>This four-patch series reduces those cases within SCMI. It prevents
>protocol device creation in exclusive raw mode, stops treating core
>created standard devices as driver owned requests, and makes the i.MX
>pinctrl driver match the standard `pinctrl` device instead of creating
>a second device for the same fwnode. It also omits the `perf` device
>when the firmware node does not describe a performance domain provider,
>without changing `cpufreq` device creation. IIO/HWMON don't have any
>fw_devlink dependency and having two devices shouldn't be an issue.
>
>These changes address the SCMI cases above; they do not provide a
>general driver core solution for devices that share a fwnode.
>
>Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
>
>[1] https://lore.kernel.org/all/20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com
>[2] https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com
>
>---
>Sudeep Holla (4):
>      firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
>      firmware: arm_scmi: Skip requests for standard protocol devices
>      pinctrl: imx: Match the standard SCMI pinctrl device
>      firmware: arm_scmi: Skip unused performance-domain devices
>

Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK

Thanks
Peng
