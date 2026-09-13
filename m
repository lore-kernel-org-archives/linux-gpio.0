Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A08390239;
	Sun, 13 Sep 2026 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289936; cv=fail; b=S4vS5Z1GvSHXafkAqqvYGkXXs16gYTAKTJF8/IW+R/C23TrFBmWPfcGl1qCab6k0+zA3pvAFOROKSpWAS7DO4HinF7KuDU9XYsvdSjPZlBXSFkvpTtWlYUy8CrshuQsM8pa3HmDGoUtVbYOz35UEadzLwl268AHskElDAp25Hdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289936; c=relaxed/simple;
	bh=tY5046cy6oV0ig7PAXS+aqCFMchIMeYDEYcBFsGoyoY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=eNT+eFJPXpEAKKynpT0yHB3DxBHc0N+r/rQLoed+nvTIFV450ZEFt5M3nFqYC5CGBpAegawlAOeUBGsWE2fD+lrgRqncl9fkH2NNIQSsmBeEU13o8ni4Rf3RoowWfFwgZf5wLtaWU9VXVBVtShA7BrI203APhHxzl0xoOaY4qh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bgw9lrRV; arc=fail smtp.client-ip=40.93.195.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bgw9lrRV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxQgZLPmzpjO/ezlkLitIscOc6ebnzVW373eUUAqkf5xdEN1xIwwmMESishMHQshCY5JKvyu5rI+/+BG42QuLBJt79KKSO8H1tez8IcCdnRvVKeeVuInEBp3VRQbAYf6cmfkjdcqGwu5r+ZVA/twIqPihA6FLgCnalXAvLfUFeNU41SamHpwE907s6m0PPj5DVV75zC6NMWYbdn0vpP0RVGZaEHl7o9hGsjR0zlnigoa2FSJHTJPPYlSTNEEjpzu2DBFOkv4U8HMueyKP2eUkZrmEHPDw0MJJok3Wa1Ou1fiQAWMRaIwk/z7WH2c4sTC5wiKLWLVwYWXmDfC1uyHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTadq3gq+pQURNoszDeJZEKifZ/BqPls1l84+Q1c/nA=;
 b=wtKhZkLoBnzjdnzTS+1ImyLVIiDlOfxdmAsUr9gAPFuiydhjMy+HS42uHmwzWNN+tRofun6Bz550mWJfFoIZYQdDw9x7ubafYTV/bioBE6bpCqzTeMC75a2BDBTUPgoZPjLTwnAiwjA5PH+H+Mbmn8ImepzPBEBhnOJs8WWvX0tEM59C8LrPTT7qRrfauiSdsOeD4wdHi5Y4TxP4k1pT5LDaAx7i/nhzLeV7ye4a1s/Hf2trRtDYufLsEJU++m41J1Ce1Wbwe07XGP0gs+bcuVd0iEMe5ZZRVipL7mdZzqAMlYnlWckLDh7Y8EpVLC335POAelZTh46wvDd7YhR7mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTadq3gq+pQURNoszDeJZEKifZ/BqPls1l84+Q1c/nA=;
 b=bgw9lrRVv5w7IdoDf6xokSJQ6ERuU5yDiLm74Wm3dCF3dZKSI0HOAtbtySxNjtdK+9klGRMCuq285pqYxn4xgJRc7nNQtJGTFY3eCui7RMGUh7VK2yDZ/9wDLqexmIqfK4ccJeCiCap8meFTm1tBgjm1Ha1jTcsCkoLAMbTKmKS4yuEplq5ypKtEGbKufi7Dz4Fx8etC4CwRF+HsJcRcziQACk9pV+zGYTCh/U2zHwbL2CAm0LR9o/+pfqqtt2GHn2W6S3Fzb47VnfoEhPVxYcgKmCfiac94AYchzgzkuxj25gp+wVJxTtJIBHUU4mya/3feNHzxC5C34/n71866dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.11; Sun, 13 Sep 2026 08:58:47 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 08:58:47 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 13 Sep 2026 17:58:43 +0900
Message-Id: <DLE2CBE8FJ9B.23HDU37C95ROK@nvidia.com>
To: "Kohei Ito" <koheiito.dev@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/3] rust: gpio: Add basic consumer abstractions
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-2-24d192f93760@gmail.com>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-2-24d192f93760@gmail.com>
X-ClientProxiedBy: TYWPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::13) To PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|DM4PR12MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: e204c322-6875-4c72-894a-08df117538c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|10070799003|7416014|376014|4143699003|11063799006|6133799003|56012099006|3023799007|10067099003|18002099003|20052099010|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	3D9PwmwrVIAe6coHqUiRWUp0LKC5RCC7mo3D3YvdeawbiNwsc2VkXrGIyrVPmUUC3lBCTmt6al9ezMy2AnlzgRy1Dj4ghQhlc0r7vvEn2yBMZjfNzfki7PxPB38viz7CZRyqG6dLD1nmlLpbSgBKdRxpNbhJoz5LjXNzs6ThiehcevREolrAFSNmxtx1SGcCckQpc+aNEgyuRsE/dLqcITSag+nMh2V+wzhRgPq/cH1bcoHujXXfE0szbqlY126YAg1j4oJMX2yBmkr1p+rsIpVmEIfdNao0Nab5PEI8c6giaFOakLwxl1aS8CKo+FS219oH606UWnie62P54g4oBpLy1oA3QlN+VE+wXflunTQqgQ7aRiZXcPxvWRSHfL/8fO11756cOBoNz10+eIDjEjSbm5H4o36MTzcugeS9n11kW3+p451yE8KrqP7f49pjtRGwFbrA6m5GwL/12MaSKDTNXbsHS14OBT2e/ybbX6gGyUxrI+QbbtoGV+8syYvDVLRf4Oh1M3mtGcx1IQuNk+Slk2/VKeYN701u/1rPimVfIT1U3utdSw9XBoWP24bmQtJWKQw+ecQh/k8V+FycnJyUpbg42HQi7s+rhYnDam1l4l2XJB4YXoj+ao42E7wDTwk/CAlAaTG2/GLWLvNy9B0RfpT99u+CUydOcMRRf6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(10070799003)(7416014)(376014)(4143699003)(11063799006)(6133799003)(56012099006)(3023799007)(10067099003)(18002099003)(20052099010)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGpUbk9YMjZLR0ZhcUlEa1U5Y2ZRS0lrVUEwMnBBc3F1SlJYOC93WXZJU3hx?=
 =?utf-8?B?NzFuRUtwcWFndFJYZHdaRkNQRlhzbzFOV3pOQS8zRWk0TFdRMGx6dTE2eDFS?=
 =?utf-8?B?NklTUnhRTGVaNjFCeklZK1BHdTFWcy9tQ1VHdmxqZ1FuNEZtaHdnLzZ6YzZ3?=
 =?utf-8?B?ZVJQTEUyQWhKbjNwa0VsMVMzeDhhcGpMdW1WMjBPQjBza0xhN2lKa0twd0s0?=
 =?utf-8?B?dTBNK2ZEUTB2MVdvampGRExKMnFOTG9BNXZ1Y2RtSkU0eXFUMnNBalVhc0ov?=
 =?utf-8?B?L2ZHeCtjdnNmRnRiVldEMXhMeTJXc3VGam5qSWIwZGFwaVdhelNidlNNaEwz?=
 =?utf-8?B?QnliYmdIbU5qdmpndm91blhDYWNjTks4RU1Ba3FNUUlrcXo2OUlYL0ZLOHRL?=
 =?utf-8?B?NXRtMEp1WkxDcHhTRG50alhxMUxzVXl5RUZKL0ZKTnhhY3VqWWVqdGxxQ0Rm?=
 =?utf-8?B?UE45TS9FZi9aeGdaTzQyelorWUZCc0tEOWJsVUhlbGhuYWpsbVpHdVFIeWp3?=
 =?utf-8?B?NUgwM09LU3M5RHFyS0s3c3c1d1VPdVpvZ1lrWHBialh3ek0vWWdSSDlEWEtJ?=
 =?utf-8?B?cXFVVGd0QzROZ2oxVlpWYlJxNXVhdkFvd01PNys3Y1Vza2J5eHJCbjNGWVdI?=
 =?utf-8?B?WXBwd3ZEZzY1dTExdDJ3QTJvTDhPekF2cysxRWlEaXlqdXhLRWg4cGhleXZE?=
 =?utf-8?B?TjlERWs0aHNiSHNJejVXSmRoN0k1WU96TnlUc0h1ZlVlaWxJbnhuak5EMS83?=
 =?utf-8?B?N0x0VnNjLzV2SHVVS283WkdHRjBCeU1FNVNINnFsbUg5dWZsUDhPSW11cUZ1?=
 =?utf-8?B?NStScHVYWlBXYlZ0UDRha1ozZG9OQTF1d0ZweGdCaFl0YllVVFVLcWJJUG1W?=
 =?utf-8?B?UGgwQWdSR0c1aTZSSER3S0dVU1RoVTNCUnZDaytOZWpLazAvLzF1ZEFYR01j?=
 =?utf-8?B?ZWxKT2svNTlrN3psQlk2VmVmeEpWTTlsL0dycVlQMlVSZUFVcWF1UmQrTDdB?=
 =?utf-8?B?ZVBOVDc3ZGlDNjkvMmNWTHNNQkRVVGFsdGtMcDBTcmQrd3pxYXU2clhacGZF?=
 =?utf-8?B?QWRYZTcvWDM5a21nWjFiNzgzdE1VWkpUVHFzOE1NeEYvaVRlNWxDTUJ3NG8r?=
 =?utf-8?B?ejU2Y0I3bDJBc1BtSyt0S2NnN1hPTVRwSStGM0tRSXV6VXpTVjBxUkUyazhv?=
 =?utf-8?B?cGNYVHRvU2czaWlSU3BkVHF2TkxnYnVCa05ZNG85RElVbEVDVE5uUkxhUW1S?=
 =?utf-8?B?alpWbW9obmE0WHFMMG5seTdCWFRUN29CblVqWFNxemJRb1ZrNHR3alRDU0Rm?=
 =?utf-8?B?cEI2d0dmaU9qRzl1d1pBZE1xcU5DZVB6bVMwVGMzNitObVBscUZNelYzRkN2?=
 =?utf-8?B?MWUxRlI3cndndEIweFVqRDNaN0hSS1dKOXY4M1VzOXpQaFQ5WnpvWUJ3Nll4?=
 =?utf-8?B?TlFLTGJzYTV2SkdHWG8rRk5FSyt2S2F6Si9sQXI3VldENXY4Q1hCOHJ4cEYy?=
 =?utf-8?B?ZWFuQlF0NlltM2k4bG9yalpybnFHS2FGM2VIOFdKYnowZ1FzenlPdmlKTEFm?=
 =?utf-8?B?cElJSVptU2tJZXV1ZmRHTjFBRzlRWEFib1VSaHFBODlBcUVJUXFwVjQzNG9l?=
 =?utf-8?B?enFJZkpvNmZBbWtsajhFblpocURQLzdvbWhKMUtZMERLRXhkaStYSHBtcFR3?=
 =?utf-8?B?d1gvd2hKUGxSVFMwVnNic0tHaDJHQ044TUh1RnRHdnUyQVA4S09FeVJGK25v?=
 =?utf-8?B?SXd6UDZacUZSQnJNY0txbXZsWE55S2paSHljWDVFVEpveXI1UjNZNWs0Vng2?=
 =?utf-8?B?QUpDOUpkQmYyVzJSbDBPVlhabHA4cCs5VFlPM0IvKzh2dTd1L25SdjBYeDY1?=
 =?utf-8?B?Slc3d1NEMFhlV0hlbDFBc2svM09raDlYQzlyUE5UWUdoZFB3eThYUDRFRjI1?=
 =?utf-8?B?ZSs1ZzdrTXRkVll5MnRTaEdybnlnMmhSbm05NGFYc25OTDh0OEVadUNkVTY3?=
 =?utf-8?B?NnZBbE1odEFuWjNZUGpENVFTRjdtemRBbzlCSm1uL1RQdms4VjYyTGc2WVFa?=
 =?utf-8?B?OThCNzdRbDM0OU9pcXpxK3BNVzlhcnZpeFF3VVU0MHFxaEltTFZOb0UvOFdY?=
 =?utf-8?B?VHRJS2JRZzREaUtvd3NxYlNIRkhjWHpTOFdrWWlCVTdIZmhJcmlqb2praENZ?=
 =?utf-8?B?WVpKakVzb1pBSzJHUXdrZDJCclNjeVk5M1JpTkpPdXdnSTJOVjBOR1NVWXNv?=
 =?utf-8?B?NXQ0bDNvM3orRVRIMXdubHlzcnp4RkdieTJFY1VPOXVJOTN5M1JNNC9ZOXZG?=
 =?utf-8?B?am1PN2dudEsxek9IdzRmSTFYalZYOGdZRzhLeDcrMGdRamxMeXBXeTFGUVd3?=
 =?utf-8?Q?tpeA1jrioI5AgiZ8dfwvzBDp3V3lLRMXD1n1OjKnvGIL9?=
X-MS-Exchange-AntiSpam-MessageData-1: RZ70nSAHPS1AwA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e204c322-6875-4c72-894a-08df117538c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 08:58:47.3099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zviqJ4EOWQzUQef/G4YQV4Btz0mfO2b5elNPEoDNffXhpApeVEpHybBVzJV3ZLCC4Joj8COZeyw5fxSx3WCVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232

On Sun Sep 6, 2026 at 5:45 PM JST, Kohei Ito wrote:
> Add basic abstractions for GPIO consumer APIs.

Wow, GPIO! That brings some good memories back. :_)

>
> Due to a bindgen issue that may generate the wrong type for enum types,
> `gpio/consumer.h` is included at the top of `bindings_helper.h` as a
> temporary workaround. Once the issue is resolved, it can be moved back
> to its proper alphabetical position.

Can you describe what the issue is, and share any relevant link?

>
> Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>

> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/gpio.rs             |   2 +
>  rust/kernel/gpio/consumer.rs    | 437 ++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 440 insertions(+)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 98b048b36771..30985c102c70 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -26,6 +26,7 @@
>   * This workaround may not be possible in some cases, depending on how t=
he C
>   * headers are set up.
>   */
> +#include <linux/gpio/consumer.h>
>  #include <linux/hrtimer_types.h>
> =20
>  #include <linux/acpi.h>
> diff --git a/rust/kernel/gpio.rs b/rust/kernel/gpio.rs
> index 819efc8a0c05..40b6c64e8f5e 100644
> --- a/rust/kernel/gpio.rs
> +++ b/rust/kernel/gpio.rs
> @@ -11,6 +11,8 @@
>      prelude::*, //
>  };
> =20
> +pub mod consumer;
> +
>  /// Describes GPIO direction.
>  #[derive(Clone, Copy, PartialEq, Eq)]
>  #[repr(u32)]
> diff --git a/rust/kernel/gpio/consumer.rs b/rust/kernel/gpio/consumer.rs
> new file mode 100644
> index 000000000000..f81c7381c075
> --- /dev/null
> +++ b/rust/kernel/gpio/consumer.rs
> @@ -0,0 +1,437 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// This file is based on rust/kernel/clk.rs.
> +
> +//! GPIO consumer abstractions.
> +//!
> +//! C header: [`include/linux/gpio/consumer.h`](srctree/include/linux/gp=
io/consumer.h)
> +//!
> +//! Reference: <https://docs.kernel.org/driver-api/gpio/consumer.html>
> +
> +use crate::{
> +    device::Device,
> +    error::{
> +        from_err_ptr,
> +        to_result,
> +        Error,
> +        Result, //
> +    },
> +    gpio::{
> +        LineDirection,
> +        LogicalLineLevel,
> +        PhysicalLineLevel, //
> +    },
> +    prelude::*, //
> +};
> +
> +use core::{ops::Deref, ptr};
> +
> +/// The GPIO descriptor flags to configure its direction and output valu=
e.
> +///
> +/// Rust abstraction for the C [`enum gpiod_flags`].
> +///
> +/// They can be combined with the operators `|`, and `&`.

The C comment for `gpiod_flags` says "these values cannot be OR'd" so I
guess this comment isn't true. Besides, there is no `BitOr` impl for
`GpiodFlags` in the patch so it actually cannot be done.

> +///
> +/// Values can be used from the associated constants such as
> +/// [`Flags::GPIOD_ASIS`].
> +#[derive(Clone, Copy, PartialEq)]
> +pub struct GpiodFlags(bindings::gpiod_flags);
> +
> +impl GpiodFlags {
> +    /// Don't change anything.
> +    pub const ASIS: Self =3D Self::new(bindings::gpiod_flags_GPIOD_ASIS)=
;
> +
> +    /// Set lines to input mode.
> +    pub const IN: Self =3D Self::new(bindings::gpiod_flags_GPIOD_IN);
> +
> +    /// Set lines to output and drive them low.
> +    pub const OUT_LOW: Self =3D Self::new(bindings::gpiod_flags_GPIOD_OU=
T_LOW);
> +
> +    /// Set lines to output and drive them high.
> +    pub const OUT_HIGH: Self =3D Self::new(bindings::gpiod_flags_GPIOD_O=
UT_HIGH);
> +
> +    /// Set lines to open-drain output and drive them low.
> +    pub const OUT_LOW_OPEN_DRAIN: Self =3D Self::new(bindings::gpiod_fla=
gs_GPIOD_OUT_LOW_OPEN_DRAIN);
> +
> +    /// Set lines to open-drain output and drive them high.
> +    pub const OUT_HIGH_OPEN_DRAIN: Self =3D
> +        Self::new(bindings::gpiod_flags_GPIOD_OUT_HIGH_OPEN_DRAIN);
> +
> +    fn into_inner(self) -> bindings::gpiod_flags {
> +        self.0
> +    }
> +
> +    // Always inline to optimize out error path of `build_assert`.
> +    #[inline(always)]
> +    const fn new(value: bindings::gpiod_flags) -> Self {
> +        build_assert!(value as u64 <=3D bindings::gpiod_flags::MAX as u6=
4);

Better to not use `build_assert` here as it inserts build-time
landmines.

Since you are only using this to build the constants above, you can just
do `Self(bindings::gpiod_flags_*)` on them. Adding an extra assert for
an bounded enum type doesn't add any extra protection.

> +        Self(value)
> +    }
> +}
> +
> +/// A reference-counted gpio descriptor.

Not really - the GPIO device is reference-counted, but descriptors are
not. Calling `gpiod_get` a second time returns `EBUSY`.

> +///
> +/// Rust abstraction for the C [`struct gpio_desc`].
> +///
> +/// # Invariants
> +///
> +/// A [`GpioDesc`] instance holds either a pointer to a valid [`struct g=
pio_desc`] created by the C
> +/// portion of the kernel or a `NULL` pointer.
> +///
> +/// Instances of this type are reference-counted. Calling [`GpioDesc::ge=
t`] ensures that the
> +/// allocation remains valid for the lifetime of the [`GpioDesc`].
> +///
> +/// # Examples
> +///
> +/// The following example demonstrates how to obtain a GPIO line for a d=
evice.
> +///
> +/// ```
> +/// use crate::{

These doctests won't compile as they are supposed to use `kernel::`, not
`crate::`.

Please make sure to include the doctests when building
(`CONFIG_RUST_KERNEL_DOCTESTS` build option), and to also build the
`rustdoc` target as per the checklist [1].

[1] https://rust-for-linux.com/contributing#submit-checklist-addendum

> +///     device::Device,
> +///     error::Result,
> +///     gpio::{
> +///         consumer::{
> +///             GpioDesc,
> +///             GpiodFlags, //
> +///         },
> +///         LogicalLineLevel, //
> +///     }, //
> +/// };
> +///
> +/// fn examine_gpio(dev: &Device) -> Result {
> +///     let gpiod =3D GpioDesc::get(dev, Some(c"reset"), GpiodFlags::ASI=
S)?;
> +///
> +///     gpiod.set_value(LogicalLineLevel::Inactive)?;
> +///
> +///     gpiod.set_value(LogicalLineLevel::Active)?;
> +///
> +///     Ok(())
> +/// }
> +/// ```
> +///
> +/// [`struct gpio_desc`]: https://docs.kernel.org/driver-api/gpio/consum=
er.html
> +#[repr(transparent)]
> +pub struct GpioDesc(*mut bindings::gpio_desc);
> +
> +// SAFETY: It is safe to call `gpiod_put` on another thread than where `=
gpiod_get` was called.
> +unsafe impl Send for GpioDesc {}

We should probably also implement `Sync` so GPIOs can be used in
interrupt context.

> +
> +impl GpioDesc {
> +    /// Gets [`GpioDesc`] corresponding to a [`Device`] and a connection=
 id.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_get`] API.
> +    ///
> +    /// [`gpiod_get`]: https://docs.kernel.org/driver-api/gpio/index.htm=
l#c.gpiod_get
> +    pub fn get(dev: &Device, name: Option<&CStr>, flags: GpiodFlags) -> =
Result<Self> {

`dev` here is only used as a lookup key, and the GPIO descriptor can
outlive the device being unbound (the GPIO can actually even be obtained
while the device is unbound!). This is because `dev` is not the provider
of the GPIO, but as the API name implies its consumer - i.e. the device
on which the GPIO is expected to have an effect.

This is what the GPIO API expects, but it looks a bit counterintuitive
when compared to most other Rust subsystems, where an obtained resource
is typically tied to the device given as parameter being bound. I think
it's worth mentioning in the comment.

> +        let con_id =3D name.map_or(ptr::null(), |n| n.as_char_ptr());
> +
> +        // SAFETY: It is safe to call [`gpiod_get`] for a valid device p=
ointer.
> +        //
> +        // INVARIANT: The reference-count is decremented when [`GpioDesc=
`] goes out of scope.
> +        Ok(Self(from_err_ptr(unsafe {
> +            bindings::gpiod_get(dev.as_raw(), con_id, flags.into_inner()=
)
> +        })?))
> +    }
> +
> +    /// Obtain the raw [`struct gpio_desc`] pointer.
> +    #[inline]
> +    fn as_raw(&self) -> *mut bindings::gpio_desc {
> +        self.0
> +    }
> +
> +    /// Get the direction.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_get_direction`] API.
> +    ///
> +    /// [`gpiod_get_direction`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_d=
irection
> +    #[inline]
> +    pub fn get_direction(&self) -> Result<LineDirection> {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_get_direction`].
> +        let ret =3D unsafe { bindings::gpiod_get_direction(self.as_raw()=
) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            LineDirection::try_from(ret)
> +        }
> +    }

IIUC the direction of a GPIO at a given point in the code is always
statically known, and only a subset of the API really make sense for a
given direction (e.g. `gpiod_set_raw_value_commit` returns `EPERM` if
the direction is not output). So this is a prime candidate for using the
typestate pattern to store the direction in the type.

I.e. you would have `GpioDesc<Input>`, `GpioDesc<Output>`, and changing
the direction would consume the descriptor and return the new one with
the requested direction.

The regulator Rust API makes use of this pattern, you can check it out
for an example if needed.

> +
> +    /// Set the GPIO direction to input.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_direction_input`] API.
> +    ///
> +    /// [`gpiod_direction_input`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_direc=
tion_input
> +    #[inline]
> +    pub fn direction_input(&self) -> Result {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_direction_input`].
> +        to_result(unsafe { bindings::gpiod_direction_input(self.as_raw()=
) })
> +    }
> +
> +    /// Set the GPIO direction to output and assign the logical value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_direction_output`] API.
> +    ///
> +    /// [`gpiod_direction_output`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_direc=
tion_output
> +    #[inline]
> +    pub fn direction_output(&self, value: LogicalLineLevel) -> Result {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_direction_output`].
> +        to_result(unsafe { bindings::gpiod_direction_output(self.as_raw(=
), value.as_c_int()) })
> +    }
> +
> +    /// Set the GPIO direction to output and assign the physical value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_direction_output_raw`] API.
> +    ///
> +    /// [`gpiod_direction_output_raw`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_direc=
tion_output_raw
> +    #[inline]
> +    pub fn direction_output_raw(&self, value: PhysicalLineLevel) -> Resu=
lt {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_direction_output_raw`].
> +        to_result(unsafe { bindings::gpiod_direction_output_raw(self.as_=
raw(), value.as_c_int()) })
> +    }
> +
> +    /// Get the logical GPIO value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_get_value`] API.
> +    ///
> +    /// [`gpiod_get_value`]: https://docs.kernel.org/driver-api/gpio/ind=
ex.html#c.gpiod_get_value
> +    #[inline]
> +    pub fn get_value(&self) -> Result<LogicalLineLevel> {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_get_value`].
> +        let ret =3D unsafe { bindings::gpiod_get_value(self.as_raw()) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            LogicalLineLevel::try_from(ret)
> +        }
> +    }
> +
> +    /// Assign the logical value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_set_value`] API.
> +    ///
> +    /// [`gpiod_set_value`]: https://docs.kernel.org/driver-api/gpio/ind=
ex.html#c.gpiod_set_value
> +    #[inline]
> +    pub fn set_value(&self, value: LogicalLineLevel) -> Result {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_set_value`].
> +        to_result(unsafe { bindings::gpiod_set_value(self.as_raw(), valu=
e.as_c_int()) })
> +    }
> +
> +    /// Get the physical GPIO value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_get_raw_value`] API.
> +    ///
> +    /// [`gpiod_get_raw_value`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_r=
aw_value
> +    #[inline]
> +    pub fn get_raw_value(&self) -> Result<PhysicalLineLevel> {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_get_raw_value`].
> +        let ret =3D unsafe { bindings::gpiod_get_raw_value(self.as_raw()=
) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            PhysicalLineLevel::try_from(ret)
> +        }
> +    }
> +
> +    /// Assign the physical value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_set_raw_value`] API.
> +    ///
> +    /// [`gpiod_set_raw_value`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_set_r=
aw_value
> +    #[inline]
> +    pub fn set_raw_value(&self, value: PhysicalLineLevel) -> Result {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_set_raw_value`].
> +        to_result(unsafe { bindings::gpiod_set_raw_value(self.as_raw(), =
value.as_c_int()) })
> +    }
> +
> +    /// Get the logical GPIO value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_get_value_cansleep`] API.
> +    ///
> +    /// [`gpiod_get_value_cansleep`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_v=
alue_cansleep
> +    #[inline]
> +    pub fn get_value_cansleep(&self) -> Result<LogicalLineLevel> {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_get_value_cansleep`].
> +        let ret =3D unsafe { bindings::gpiod_get_value_cansleep(self.as_=
raw()) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            LogicalLineLevel::try_from(ret)
> +        }
> +    }

Here as well it would have been nice if we could avoid having
`_cansleep` variants, but I am not sure there is anything we can do for
that so I guess we'll need to keep all the variants.

> +
> +    /// Assign the logical value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_set_value_cansleep`] API.
> +    ///
> +    /// [`gpiod_set_value_cansleep`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_set_v=
alue_cansleep
> +    #[inline]
> +    pub fn set_value_cansleep(&self, value: LogicalLineLevel) -> Result =
{
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_set_value_cansleep`].
> +        to_result(unsafe { bindings::gpiod_set_value_cansleep(self.as_ra=
w(), value.as_c_int()) })
> +    }
> +
> +    /// Get the physical GPIO value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_get_raw_value_cansleep`] API.
> +    ///
> +    /// [`gpiod_get_raw_value_cansleep`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_r=
aw_value_cansleep
> +    #[inline]
> +    pub fn get_raw_value_cansleep(&self) -> Result<PhysicalLineLevel> {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_get_raw_value_cansleep`].
> +        let ret =3D unsafe { bindings::gpiod_get_raw_value_cansleep(self=
.as_raw()) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            PhysicalLineLevel::try_from(ret)
> +        }
> +    }
> +
> +    /// Assign the physical value.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_set_raw_value_cansleep`] API.
> +    ///
> +    /// [`gpiod_set_raw_value_cansleep`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_set_r=
aw_value_cansleep
> +    #[inline]
> +    pub fn set_raw_value_cansleep(&self, value: PhysicalLineLevel) -> Re=
sult {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_set_raw_value_cansleep`].
> +        to_result(unsafe {
> +            bindings::gpiod_set_raw_value_cansleep(self.as_raw(), value.=
as_c_int())
> +        })
> +    }
> +
> +    /// Test whether the GPIO is active-low or not.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_is_active_low`] API.
> +    ///
> +    /// [`gpiod_is_active_low`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_is_ac=
tive_low
> +    #[inline]
> +    pub fn is_active_low(&self) -> Result<bool> {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_is_active_low`].
> +        match unsafe { bindings::gpiod_is_active_low(self.as_raw()) } {
> +            0 =3D> Ok(false),
> +            1 =3D> Ok(true),
> +            err =3D> Err(Error::from_errno(err)),
> +        }

In C this function cannot fail for a valid descriptor, so the Rust one
shouldn't either. Anything !=3D 0 can be considered `true`.

> +    }
> +
> +    /// Report whether gpio value access may sleep or not.
> +    ///
> +    /// Equivalent to the kernel's [`gpiod_cansleep`] API.
> +    ///
> +    /// [`gpiod_cansleep`]:
> +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_cansl=
eep
> +    #[inline]
> +    pub fn cansleep(&self) -> Result<bool> {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid argu=
ment for
> +        // [`gpiod_cansleep`].
> +        match unsafe { bindings::gpiod_cansleep(self.as_raw()) } {
> +            0 =3D> Ok(false),
> +            1 =3D> Ok(true),
> +            err =3D> Err(Error::from_errno(err)),
> +        }
> +    }

Same here.

Also, as a general guideline, it is good to have a concrete user for new
Rust abstractions. Do you have a project that will make use of this?
