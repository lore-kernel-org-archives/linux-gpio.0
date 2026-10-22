Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.53.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792658036;
	b=nMSc/3vD8CEBNnMOTgA7HLblUqd0swWZechVMvj6xYVeWx7ZDdjlo+Nz0f2WPRxMXM0E
	 aNtRttAyeGQmhfhARiVNYLaCh7YSCI7CM+haJ0uvMge7G20zRZtt9CJQaf6J1ple/KfMw
	 uhHKGAR5dc0L09heDuNY++SKSwgxkVbVIv0G/yyPjQdMaKNeABsX/ehLjrw54y71NqE0/
	 gcUxWvqXmIPl1vbVKWAvSjLJnL2JKnestXj66N7Sfd9E0a3SAN2MsGtXhYmMhfYlYbG++
	 cjhFTqsP5HwkbKDVrNZkKvhwcBzz9k/HX/2XAnmQgjmVJs2l1/qdsp9iLka8Elt176w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658036;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6WbDFhxRPQLE4yd9skM3+G315eXtjUICwy1QEmbqUBI=;
	b=XPdIBbvKfHi75WMLZyH8ETTwaM1hDXYWYIU1q8d3ag+lhDCIAnSF7AlECKHDAR4B2xz3
	 A2D0K2e4ZN0WGEo5JzieLbyq2H20t9j/8ZGXDKpIUfD+wGuga9zJVYaryvRbccJrvqIdt
	 +AVQZmHU8vWqT3ydtCpCMbAImwnPD067rLp07VY7eUY379SdX2iarvGZ4Lg09Q6jnnVUD
	 41oAWPHIetcAr8y5/KXdFnR9WabGeyc/NzRtrsOZgqKx8KH0or/NdjsidHI5u28fWMnk8
	 aViM3Ks68W27GdhF24M9FF+yF0Ozopg7x3o5ge8F12qbKUTBD34w1jqmpuTB/w3Gb6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cyZ9aXj2;
	arc=fail smtp.remote-ip=52.101.53.25
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1BC606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 08:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE1BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cyZ9aXj2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kouXXCqCYcAI5bu2nPYcnfzn9j+Dtg4DdkBoximoPSXlob8ymJFcf2Kfx5wkrIgS8gTh5p2E16Jr++6PX9WbIJjk8OXFZR5F43M+g9ZLlNi5T0bKG8LpPDQ5TMuPx+ZkQ6Ixc1jFHRhBCgGaQKwM4BPM8HGT64qDijserx1RjmygaIN4xgIkwq9B/L3crL88//811yE8RLZffeUZPJZve3H1B+oGv8V6QHPQyaaDE6x+1Jylp2IbJBHOatDlFDEwYh0oRpIVsM2d4J5xMwTyxqBDUelL5eSSrDUINJRemMzNCSdECItsyALRwnIXXrkVVON3gzjhcieD5f90MMGmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WbDFhxRPQLE4yd9skM3+G315eXtjUICwy1QEmbqUBI=;
 b=hVoLggXL25kQj7lSOJf9fCzVIX6Ku7QK1aQcYA6z5EvUiM6Z7OhGjXsOae5DwmOV+5tStpfPMQlb3n8Hh3CM+s3gUiSAjscQCpHa4kCZm681GvHKiYs8FTZFbIXyB6u3nZXDfRwyo4Bb0TdwY6+QXRmqRLku9wAa5MGdJx/7CmpF1efZB3fqLks3k7zmoapptD1mCsV0U+Kr6kkkqy03GuOhp5AxVEHdgOVKABJ7LFZuD9uhxdebwEpS8EIcuRQym0slDqy3FjnUl0kOFBnk7d8RPOVMg3BtVh+igaKIz5KehDNe/yYEqnd3hfY6eJ6QzP6JsQfxK4GVK+yliCmqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WbDFhxRPQLE4yd9skM3+G315eXtjUICwy1QEmbqUBI=;
 b=cyZ9aXj2GvUIDThWHinw049yaTJkf5qDCYvZTJTJANQt3yL5IN/hD1LS792yNoA2n1oW9tThh3V8RjKB+g5OMgRmYyyzT0F6zhMNuE9w2O6ebeTWZh4le2gyRIR6IUkoOajuY+OqcJ8cw97vPcvj5DZTcUbOjvcH1SODeyLnliJnhgEf7f5G8NBBEVZ9oWws4YJ/EE22VSAL7Ozz2j1F8apNPOqc6rrlcZkVVRYIAivcP3I3hCg4nJB5x1+TlaqdQnmeAvw6iuwTdc7I8vCXduP6OZtxsLlufYXgkI6w9QclD2Ew1Ao/NhYIlgniL/iVaJ4l8iuiGZCLkPVsHOmcww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by IA3PR12MB460542.namprd12.prod.outlook.com (2603:10b6:208:709::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:33:53 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 08:33:53 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3 6/6] gpiolib: let the character device free its IRQs first on chip removal
Date: Thu, 22 Oct 2026 11:33:45 +0300
Message-ID: <20261022083343.3905973-4-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAMRc=Mduzetc38ZttGFEQqtOnyvD-PumZ7=m5FOEF75eGpq55Q@mail.gmail.com>
References: <20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com> <20261020-gpiolib-chip-removal-v3-6-aambrozewicz@nvidia.com> <sashiko-outbox-179021@kernel.org> <20261021095551.3283369-6-aambrozewicz@nvidia.com> <CAMRc=Mduzetc38ZttGFEQqtOnyvD-PumZ7=m5FOEF75eGpq55Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0068.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::11) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|IA3PR12MB460542:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fde8be2-8aca-4616-6cd0-08df3017343a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|22082099003|10067099003|18002099003|261021121427099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	fLxriiSx4uXy7p+xRUMUr093Rr8UVVV5BXDAKjAFBDrmxr1grDanGuxk08AZ8ZhWKWOecPRTFYtB9E7PEybGzYnF/msnBUpbddnM5QX6BYDhI3xBPmImcXyDCKOSaGGHIB9c6VKQAANjfCsfnlrLn1A1yjpQ9hq9jEQGKlvOATL3NIK+hBhWILHCQ2SiBr5b+kvZSFsH0YnDP6rFqKZcCp4Ks0EcsQMRbyNzq9mDfZZmmICe4o/lB1VBAX9QTAEcigybLJgEfMm0+SDXLJARNMaj3i8xDmlY57TdYwlDtYWTg5Mnh/pbUF53iminvXZ+DBjRYphlPL0fvvpKWFp5ZSBlJa1Eh1u8w7qB3jAYoexc9FMETZoYiph24ndorAcHc/+rJyrQkKwRM3k3Eimwp3BYqkFhvlUiiJqGT/LLACEovKXMqsX9Idp3n9WDad3Ie4/5KurY9JySkp/Z/ZDtfkYmZaC+5hY57HyKLgl2Ml7880A6JBanMW9cbyLjiMmLNWl6qkQcPXu5Jmf5MtTs+hPSDhJeTZoMoLEjOU38bG2tWbP4Cek/qgH0hnq5YIrkrE5+CUDPz7vAUGifPVvZagueU+XMLs4f0gZsc8P7WiA6Rjq9xWqAOZpM5BLjMSQgx+kXeK+h+1Ja2i2NhoKCxhcxmCLY2ncw4uuiEqxwLgE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(10067099003)(18002099003)(261021121427099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b7wYOl/EJ0QdMVSmr2EPn5PKqWQWIB9+pMO91Dg/XgKEI7BvXHJ0nVSIUGAh?=
 =?us-ascii?Q?N3Uv17Jd34CJjlc1p1wkkY8nemN554zS2zNXBa/+ceg19iNPK6Ks2L6lT2F6?=
 =?us-ascii?Q?qU/9G/yuw4Aj+MbGiiL4SwiVwaizuIZ1z//PTUXmjF8jownLOrNo8ALUUQWV?=
 =?us-ascii?Q?ZUksR6EnGVpGxCwuKNoXZmzQlv1b3uKyS0DlnHq4MIRkGQyU5ze3BTA65+Mk?=
 =?us-ascii?Q?7Gv/pQv41i6R61vdeLF6ScjM82BAJbDP826L2Q+KMt/dFr8X3HKj+DclTiGK?=
 =?us-ascii?Q?/fJiMJzGZ/Nm7hXSxIy8JeE6uIm3OR96bM1eyxrGnJUNbY0uareYSlu+wRIR?=
 =?us-ascii?Q?panOflJ3OUzt/h4zoX7bC6pciAzIBYpLdWIzJp7LYgVKvH4ocDf91weUTeI7?=
 =?us-ascii?Q?lGBFg6E15dHSsa3o/znnKs4ICrspl+HrAyXfxRl5qBb3x94bpXGAkKVEMpfC?=
 =?us-ascii?Q?PAPhUwOqXPQX84D7/tR8rR0dM0/jpMtyo59wmtWLddojIh2NNmkAJxb6FqSK?=
 =?us-ascii?Q?QyC0GpZdM4KrgsPuE0UW5dsB2WAjadVSpETGXL0VVZe2Hl+DOX/rL2koBllZ?=
 =?us-ascii?Q?oPgBQWRfdVddyh3JCueD9AFSRE0VNh9y9/erB7OC7cKGqaB19VJMluvSY0gV?=
 =?us-ascii?Q?X4SGnytVOCbOq+BOQ+2naKi27I4hIwjutxOnxAxyulnUdV+8SZN3ovMEqPnY?=
 =?us-ascii?Q?N/derv5LxBn3qdwvcKJ4fdLReA62YCIQ1hMrb0ZbIPVrtLpVAhDv3Rsg0Y0q?=
 =?us-ascii?Q?SfoTkcNq3UKNdTq22JK7aOBc9PHyIljnpfC5/VwdohALawwEC1UzB/sciTAZ?=
 =?us-ascii?Q?50rgf3KQiED5TMDktEiCctUUtk1UelTOUBrgFUArn7qNZvxtbLE0fXMjIEos?=
 =?us-ascii?Q?2MdiYNyudPX/Ig6Ift8zXFy0gRUk/vG7qz3+UiYFa5WCiecE2OlWw3kI7PuX?=
 =?us-ascii?Q?8rUYR5BgQRwDOkwdPlGjaQx/NRnkavytLOxVy2ItBUZpwwIQ5cX9Zc+/U/lf?=
 =?us-ascii?Q?f101u2m1lNB6SgTxV0V2UIv9OPHt9OlyPJYTR8t3my1RVKtbrlthGxyGuu7h?=
 =?us-ascii?Q?C7EB/kOm4zdt1n8xq0/0LJbKY7W51rYQM8LBfEZGnr4WHkgiukHx4b/WtGwF?=
 =?us-ascii?Q?GToAXMB6pWvKIRJVxTwB9uHh2BQDAZJH5sT7cRTQybm33mwVkoZokK15t+97?=
 =?us-ascii?Q?c0/0lLLDIMyNHG9T6xK2VTdRkfrHljGl5BUg6RYeZcPHyF47MqYH5Diheve4?=
 =?us-ascii?Q?I6hg0AX76aW1J1v6q5oUVf/1ZAJE8u6LAmS4qFD5s9shMXqhh0lvXnMAMKXD?=
 =?us-ascii?Q?zfSDwuQ2QwJEK/qYVyJ51r3J6VEIYG7IDBxG1SYkm+jDZu+krzqqBhMhPuiP?=
 =?us-ascii?Q?wRXJykYtpM4V/sWpjmWLtqy3863DmIta1HL28fNowVSb16b2xz0t/2LcdMmJ?=
 =?us-ascii?Q?4NAJq3rUa5HJTvKIyYmyMRULgeY+4Vw2hDcxs4Uw2+R3Hzjqtp3BVpWlu6ne?=
 =?us-ascii?Q?73Cz+/LUoJjcJbMQ1IaOFe1c54lNRdg8yILqEOXobSDp0VqcoUiR26KMJkNf?=
 =?us-ascii?Q?ZlAChXiQ9WStxzCsB8Y+KX7Yg0AkvVU4l1+Nsddj81OY5sGotODUZMwiNtCO?=
 =?us-ascii?Q?YHp93GUOp4l54MMaemIXdCcIRJ1CEZTdZ/XeoIxg/vnbihRDb800VvjgPIzd?=
 =?us-ascii?Q?wQEHeAzTEv1ALRi2thTeLRlvaqkaSpmGaWl3TcLMEXjKhviTMjf4KpSEh9Rj?=
 =?us-ascii?Q?xT/BePEBqA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fde8be2-8aca-4616-6cd0-08df3017343a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:33:52.9433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnJrTICl1CTgl8A2voUmOaozrGyZoiCbCQTfUwcS2SE3o7pEMSU6v8pAZpbr/d+vs5sTEi+W1zKv3N0v0I/P1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB460542

On Wed, Oct 21, 2026 at 06:05:33AM -0400, Bartosz Golaszewski wrote:
> As annoying as sashiko reports are, I think they will result in better code in
> the end. Thanks for addressing these issues.

Sashiko did a tremendous job on this series, and I find that kind of
help encouraging rather than annoying. For a newcomer it is a great
safety net, and in the end the code is more solid for it.

Adrian
