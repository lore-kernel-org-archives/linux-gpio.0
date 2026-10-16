Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D963839B9;
	Fri, 16 Oct 2026 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143561; cv=fail; b=WhFbOnv2dDOq0Sox424SjKPjlLte+2iVkx4RH33wq+c3wWeBqSA67Nl1XnFbzfcXr27wLVC6EWigMD+Ma+iu3rbjG6HEg99J3EiPyAu5N1ZQOlRZpwqpJ5J6Q++dSXTHHmx35X6w4znOEWolnkc1URnz6mtT7b0d1haok2oAlxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143561; c=relaxed/simple;
	bh=ZgNRA5SpPbmkZ1eXdONpiEtC/kY3Zj6toH63lXmjJ9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l2HhoYgtQG1b2rnMGMqLaJe7i1hG3IcdjjsZsRuY7ba3MmG8boXe2U92VIwYdyM6zXEvtFxXd+oQIPSL20bzNhxwMlK80z0h5KGcXr78LVeT5kv+XHaARrkTXjoEVhictjxDehA/aYj8zB5wsbcoEZLXLW5cUDB6ajH2IKTtf7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JgkM0okE; arc=fail smtp.client-ip=40.93.194.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JgkM0okE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hl7RAjNnKSC998bVrZmSwQPx24zQUQD4zqBqCSDdTZQNbbDuECeN7Be5/Mjr5EZQWPrtYEwsgcrC8Y0bkrAuBUVPTMQROUXMpJMXSxTs0KWcVgQiPB843FZm3YipdmBn7+uGZb05b43pgWtIAVwqYK60xPSehbVVGBhZvbdLl3wBeA32APeu10RxcrW3Yni0ThPnjnLaz8obHFR+X8ju1uMyLgjopok/jac8VZPJrHhaT18PExmxphrhg30DItyE5Ryiaq7zNwgpb2EH8TfyXDBppAs0NMrsvL662ekQMdr6tszBUZ7TIjPRyUKLENm3VUHLPh6FSgqbkIjZloYR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgNRA5SpPbmkZ1eXdONpiEtC/kY3Zj6toH63lXmjJ9M=;
 b=CaWBgfCbHqHIcxfI/8gt3OxhlxNosXSMJbrlSAAzLuizx8rZTa6VeZbrOFB3Urg8WbfHVvLEITgtNcN1ds3C5cNgsKyESNlPGJ6Io1i0m//MIoh+gAt6sTA+inXsmIixQV2nOP+u44nqdGWsz1TqtdZPntnxoLGQ0NqAs55iw3SQpXjWFoyfokHfSIniPFAXX1zQp2LkfFw98VJCgHn9+F7hnTQl9n+g0meSv6v8ZiOF508+m9/HiyICmfOw5swRuw02vbz0poj8YGsQYN1UMtWyzp1Mq4UrSg+f+yX/ncp0NwEFOOevStUDb4H7y21Y6Mw/uNnkja6jlfn3cmztIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgNRA5SpPbmkZ1eXdONpiEtC/kY3Zj6toH63lXmjJ9M=;
 b=JgkM0okE8tou+kTPMvBX/ay+wMeAhbEZtlIyHo7gGYelomEBC9RyzWpnBGhzebUts6MQxJ8Fw8/6kTE1aFjVIDGqQiwPySL1JyLTTijbRgTHetyh3WS+eiNpu7yWy/FS8WTlqcrA2KNMFIaswlNQAvETgNVmOooH/04TwdZ/srw+0AK8qxGwi8heW7tPtVlOHAM4EBFhVaehUtnDQct/ISydwusQShQLVuzvq4pWrcshAbdNZ7cwrngjqj9A2RmOmIEpmMy7+evJKcZQGbgo1dx09HYuC7uY/lQVvGU5k6SKWQ9inZ1sUc1vfDn05WqW+UZwzInqgWgui5Wah84Wcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by LV1PR12MB090032.namprd12.prod.outlook.com (2603:10b6:408:516::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Fri, 16 Oct
 2026 09:39:17 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:39:16 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kent Gibson <warthog618@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: clear the event clock flags when a line is released
Date: Fri, 16 Oct 2026 12:39:12 +0300
Message-ID: <20261016093912.2060866-1-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAMRc=Mc89+8Vaxno65wepjg9MwSNeHZGtb=FQ0QVAv7rAZYLNQ@mail.gmail.com>
References: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com> <sashiko-outbox-168236@kernel.org> <20261016074704.1860749-10-aambrozewicz@nvidia.com> <CAMRc=Mc89+8Vaxno65wepjg9MwSNeHZGtb=FQ0QVAv7rAZYLNQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::17) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|LV1PR12MB090032:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc91083-2e15-44f0-e4dc-08df2b69589e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|10067099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	CZtpI+gNBQnLwx/j35iOyvOZCuAp1nQMWGzbBB6Bi65l1qzxiaiwiqXbhboC8nPiT9QFDQuOBTOO3CIhftlO5m0hdOg+ObslFcBHByB3S42UDvuPtnBoZIj3ZD9MXr63WhRv+msklgpipf5F9OitrH1mDV97v2iJ8MSIZUH4snOmNTqyZB23LWQLMBj9Xo1JULScEe2UZ3qgtpS10UGb5CZt1bW272ObJOi29vkt42H3phPg50Rn+v2uVr9cG+Tzb4NkoXidD4m0HTxCEzb1uX8jdr1Tu5Rcbd+cAUQb+Y3xk4WXppEHLqBlWm6U4gbfM4FdJeDYY1lVQtWCDfxcs2/8inMercTvNqLn7kZ5ydWf0KlH4VdjrNO0dodNlxrYYk81H35f32PLmsp+de3uEMCHNxRDV7mKpeGtSSZ/EOzI5jqNC8u53DPSQ1TJ6dBnqZZULVy8scHPpFp8iAkNF0D/7FktkGFCe0VSP5OdI37dKoIMewMnZgw8NcIIL6q3qqfsGElRErxfoTn9Ir+YnSBwzJjlVyhX2IXD9PzW1hx290xJufzpRtpy3tYSubHB47CIMh9WYGE5nc2nwAaKO+0yRPjM622vBUvJNK/snhKjcBGwbZwzQ6Ot/5SIxY6RhKbg/hKhzTXjG+nMtPhg6OrkVP0kJ0NK6ZKRorqAd2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(10067099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?STuJ5T7qq7/DxXdV79snmz8Jyn4UgYbpGn8YkBWbRAMGtkSEXQSnS2Y8wcw1?=
 =?us-ascii?Q?QWo3HTt3ntc6mzf8nx0g71Sucr4T2KZymp0cfZLkbP4JRZC1GEpHh2KOakIc?=
 =?us-ascii?Q?yqA2T/li1CHMNcbVbD9gApx1VDg6KTkL7gbG2tq8gyRjDYUk4lRLIja6JIL8?=
 =?us-ascii?Q?g0oDIuTp13JrJcUXU3qpb5shGEU1B6NmNhOHooHmfXdsqnYkrsQTYlL+MQPz?=
 =?us-ascii?Q?WYDykSeIqDuXOIuZLToJfLJ1Lcs/6i1jcrjiAEhXffOc2DgAOwAvN1WVcLvv?=
 =?us-ascii?Q?gU5SSRPGro/ORYWZ4XvGpUf7iKsYhSxUhuvn8B4i2rib8PVySZEwOK6vpyp8?=
 =?us-ascii?Q?hg8SbQo8xrpiFaE41g94sadz8NwR0Fw+F7aEEMeBN+d6Dt9DttVMdyeUaFTl?=
 =?us-ascii?Q?lftB89obt/aU0ofctI0vi8+RZb6KdtZMkrfMv6QOt3Mrrenx3xNp+Ml9P0xA?=
 =?us-ascii?Q?ACu9y3aFgzdgYBDAzX4/xI4u5IzqvSuhGqQAgumQen8q9o7Kiih1ZJI5yHhB?=
 =?us-ascii?Q?T62HCFWZsIh7ukZCd+O4XNAbGIJQpzNNyLA11wr8Je9sFn+hgTZERDw5Qb6D?=
 =?us-ascii?Q?VjN4dSiPok28JV7uqi3mELfgyE3VMykIZozz3+EX4xMwO/qXH6B6pgiLDbcB?=
 =?us-ascii?Q?oZsaClpaHVXc0JnOJcQS4XGZimdk/VNXr5htJAmZURTMBrZbQu0OXn8WQUxm?=
 =?us-ascii?Q?VJ/ly/Kt2lj2lZMtOI2dmJWno1f+bV4yiVFOyJNxFXYX/lTgHLamf09uS+ac?=
 =?us-ascii?Q?BG0QH2v4KYAQ5eG1vesyzlbAscv9JAAZSBAbk+Xq1b+geJW9pOHDd1//4aMe?=
 =?us-ascii?Q?An3oDZr9InvzTkxH6odTAgPkhufxtSEdt9fNakTYS2ZGZYdEq9mscQfCrkl4?=
 =?us-ascii?Q?0qVdeGIkeCfriD8cWXxdZIFEh2rnq3XWFDMQoJ0CduWTTORhM0pn74bHrr88?=
 =?us-ascii?Q?Mlw0fsSoOsSvqcgT/J7AE639vM9tg/UCI09F1vETXkyo6TIErzCz2rXrg9Bj?=
 =?us-ascii?Q?HKugCGejNPgl//npEC2x3BdTx2jJ7ZhIJAhndzrS803P2w97mcy0UYOQubG8?=
 =?us-ascii?Q?q1LS+VVPjqvjYJbixWeBpUGGI0c78AGOA4XdeiJDmcLwTvKHD1uSiaJWN43Z?=
 =?us-ascii?Q?4YHlZPkqqJ9br5sz30rG+nlPhI8t1osptjTJefOAvtlktFIQvctJ4P3QLc/j?=
 =?us-ascii?Q?V6jObcEnUlRIUGk/6UaWTNKM3vsIFJN7/lkYVt6keGwY2evBI+204OjeL6CS?=
 =?us-ascii?Q?ai7qrTda4xdbSXOiN1V6tTaRRl2YtaYLwH97veFrq3S97G5NXlwFSuBOjTy4?=
 =?us-ascii?Q?Ah4rdwbGIhr7JasoLAvS4j6RaejV8C45LEY3ZJFIOAscuLW5u45IynCq/cX2?=
 =?us-ascii?Q?EddJZ7iBLCF/NmUfX9kE+bcobIZASSz2vSh7SrQgEI+pLptGbUJ8XQRbYtvb?=
 =?us-ascii?Q?7T9vyrbWBPNpv+PV6oz0O4T+BhtQDm3Ggo1zLxxEBSDG52aBFLLh7KkcIbPe?=
 =?us-ascii?Q?47fQHw5WwTqDl1kefpGLopDj3botIPJ7O11trBkF6nv8+O+qORzpTGPrFy1b?=
 =?us-ascii?Q?5kaBVesJlHwL6YwDJiEHHz4GJEucorUM2I7dPprcLV9IBH4ZKrVqsyyeywsH?=
 =?us-ascii?Q?xi8ZaVY8f0U0cfrd6r4Lt6hv2XEjM1VhyHLsF7JPB2CJOJPSBD2ZpemNjmIc?=
 =?us-ascii?Q?dD14DCfLxTs4CSewVKAmhQ7YNiGhf5bYQ1n/CRy/bHZkvYpdv5JRO2xk2HAV?=
 =?us-ascii?Q?mK0AbpCCdA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc91083-2e15-44f0-e4dc-08df2b69589e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:39:16.9101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYIVTGnpONL9gA+Vl9CXU5vvieY4xb9rGy+T5bCObgfNX0DL8CNExhgIsRIjjLfMvYxoousf8iolvFAeAl2KJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB090032

On Fri, Oct 16, 2026 at 04:03:24AM -0500, Bartosz Golaszewski wrote:
> Will you resend this together with that v2? Or should I take it independently?

Please take it independently. It doesn't depend on the removal series
and still applies to gpio/for-current and gpio/for-next.

The debounce fix didn't go into v2 in the end: Kent asked to keep fixes
for existing problems out of the removal series, and the fix builds on
the gpiod_free_commit() rework in patch 2. I'll send it once the series
is applied.

Adrian
