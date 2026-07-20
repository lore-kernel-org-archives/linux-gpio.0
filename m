Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B593A9620;
	Mon, 20 Jul 2026 05:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784526164; cv=fail; b=Lft79IMxr3bMzfUpk84DNzI6b578jyCDbKuVG0c2nOrHIaL8wz0BWCPUOV4C2hAMguE09e/KstGooNJWa4oDlm5CpHlSxlwHiS+6t0RuHfBsFCa/d3WjKAlu/KVcQKr3iUdRnNF8E8+1WiTVxai+sd3bJf/MPyM0Xm0GJOXexD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784526164; c=relaxed/simple;
	bh=NY8U4Kw1+OXLRBZ+5XJkylnXgJD7cKZn0o+5+g7JTh4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cp6S0pmwqfIYVf+lQjNNEnoq2ZEdUdrAQkPugG7AgBYCfWilGadRk/Tt17aDfN6U0feaSvTWq7EArY1cnVEjqjcUNjTzEZU3seK/5SLWwruZcTX3YxSYkyBR2c0Poiuw72UDOS/JhhFkxMHukPVLbxbJemoLvp6ZJwUA6qaHu68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNHEszHI; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNHEszHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784526162; x=1816062162;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NY8U4Kw1+OXLRBZ+5XJkylnXgJD7cKZn0o+5+g7JTh4=;
  b=lNHEszHIMIPNuF18zql0bST5a7O0SjdP/z+WgXoZPMHsO41w8R/fRICO
   SIUhNpaJqN9Q5Ww6BmEzDFznB876U4RTo2lH92o9S7DntWBnd0DQmOtV6
   etfShowUuJWlIAAoAcOn3Z0ogcwcYM45EbZQ5JRSB054TFNWJUhAg49C2
   ACp+4yMGEk5+b7KhVDRhtX2ZQHKKhDuj91Y59WWCPQLD/h0r+eii3LeMH
   Ja9MshurndVEbyvQE4CeUz6pxyXRgsVsmIhf3KSRHn5en14jxMq4FTq4v
   Rh9Gn+7mKRiAji7XCWNvOAKeK0Betd1fs6Fc+9Bo3qoJLEOJYLKJ0G2QC
   A==;
X-CSE-ConnectionGUID: lZSFgjw9TJ+fwsLv1ZClVQ==
X-CSE-MsgGUID: muiD7bkBSkCGP5E962yn6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="107887084"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="107887084"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 22:42:42 -0700
X-CSE-ConnectionGUID: uEnBtzVpTZC/TdzEKGyttQ==
X-CSE-MsgGUID: h6cmqjBeTN+fcNMqpfSSvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="281822949"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 22:42:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 22:42:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 22:42:40 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 22:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXvQa09TX0bpgqjEhkB0TijbhlwhnsEnwrkIGZxXNco5DRyR0XpJaVpgtgsG2lgYON5Z6i8gGm+7TtXj3p5yWctU/kOnjhJ0MZb1R5JRNCq9pjQs6LVn2qSp29A45X5N5a9XE/ZiezzxkGYo7gXjIYFxGuqltC+3Zi93OFi5/Sz3JHXRCmsY7QyIHpMB88nvBS/uYHlEUVcu5gBLUrcUgw5gdYY3QImpqZ23A+uTq5DhHGlZigTKuyGegNjNraswZ9V/52pEbUCYn5bvMAadC+AmYfQFLmBHNWrsdYRdJKGd4sm/GQjvH6czHCj4jGdb1G28zbM8Y0fO+T8NgPUdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY8U4Kw1+OXLRBZ+5XJkylnXgJD7cKZn0o+5+g7JTh4=;
 b=kfNso89YsWutM/VwYRncckuCsJjUGs+TfSUk/N4Sglx+0tmT+OYgbrjo9jyV0sRQWUjdlolmOc4L9hb8kctzrylkWhrMj7EgYPMHBj62WX00JnnqwvfVlwM8n0sucKkvmZqdI+RL5dqASEm81sUd30q4KYgANIewv/caxXdkCf0Dg0iSt8NXnmByKM2YfseZZx4svmIMR+5P8a/cfn5+vKpHqwbt+kH83XVwEl8p1D2tkct6fRe4/n7gw3Sq34DB0KFGNPSxv/0Yp2gcss6wLmjNjj4+pH/xyzUoJTmO5/mjfJ4nlg70DDSludXgwLqwWgleKGDDT+3crn5AZaUgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 05:42:37 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::a7ca:db6b:7913:d6ae]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::a7ca:db6b:7913:d6ae%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 05:42:37 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: David Lee <david.lee@trailofbits.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, "Dominik
 'Disconnect3d' Czarnota" <dominik.czarnota@trailofbits.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] gpio: ljca: validate event payload length
Thread-Topic: [PATCH] gpio: ljca: validate event payload length
Thread-Index: AQHdFfzG7SIFRFszWkmOs/Kk371ZTrZ15/4w
Date: Mon, 20 Jul 2026 05:42:37 +0000
Message-ID: <SJ0PR11MB5613FB06234388F4B35B1D2393C32@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20260717145827.43889-1-david.lee@trailofbits.com>
In-Reply-To: <20260717145827.43889-1-david.lee@trailofbits.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|MW4PR11MB6620:EE_
x-ms-office365-filtering-correlation-id: 3e165bca-b52b-4279-2baf-08dee621b4cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info: +m7tHnkdBWpXuu1SxxQ8fpMz4X+qw6P38R9N6ES9nvl+LMzYyO761WSNLnV+zmhRIZ4srUAG0vxtDv8vRsKS5sRw6s6YAzQzphhhYzA7hSmEGyZ9SOJIKPEzAZOCOiKlLHFTeyWehDiggqM/jrmMjgskxRo6y3cMD692RKC9ExQF3BEOsQUufdfDkKIUDUxpwqOojyTZJSDTgZqQklIBRAIB5irdqNvhhXAuQV4SvGYtxsrPuwOJIR6L2Xe92/Mtc6YHhyNeErapuasfTD9nh/zpao6sE25THvxvXhBtglq3VTqHQJP6LvOQITyR1nkjbwDj7OlMyaDGqQx5CuiDlnIj/lEcymoxuzd5KCIAVqepIW7+3UGgoL5OwVLQnru2sQR9gMTgL0VMjVXz+Md0YEdNADP5wDsFdrVvJA6T7D/+BlnkyCo3kiWJhiB5EKilJdCEVzeF8jxXYrjPtXAZF97bkeh0M0J6A+LKuS+P+JniiIPpQoDBi4jFDtmlWbdkO7wr3NTx7TcWMHN9duOppwTtSrqj4TrspJWAheEkMg8UllTBQJXOOPkSDlusS7J2Mg5xPO9fjKLu2nyGYG5a1jVtErLXPOuLfXvn5WP/+f8A0VOdNAqLWNQ6G71glbDdYWTtLZrrKRZ4bSRcL592KyccC1q992Bpis4+abhYLWRq+/h+tpqMgjLEjGLbowzEgot9NFLWmc4IhAU5T0mVhZfzodpjyKBbA0DLye4FTIk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nkTAF4feF3H48s5gfUIyJpYkBh4XnqJuHJQStQN6XehRUOvGp9g2XvqV5LKX?=
 =?us-ascii?Q?Ou9EBtLq0TdewylJQetSIEz4bOTluu3Qe6522RF7pUwz5h8gEkl1EsFYuuXk?=
 =?us-ascii?Q?dRjbbSiVlWhEJzNAITAC0HKNITQwZAKgUf20pRppM89CkWSntEoxBwtrJGPk?=
 =?us-ascii?Q?JnUOYe5+VXn4BRpO0B9TEvPKgMiign6ApMzkDiq4cnmDxXubJHy2uoxxKugo?=
 =?us-ascii?Q?08ycdsilDdFXrPUWLj0HRmfw2JxHcEeTWQ2r4Eas2zvcx3W2GAWWZF0rl0XY?=
 =?us-ascii?Q?0qJgZmpfYcFlnSJYPRy3+4WefDW5Wxt5T856Qi5KQuz8shHFeDl+OS9xqvB2?=
 =?us-ascii?Q?34Hec6oqGRA4A9yf3q5rDdQp/B4dytHfhDHzbeBCufYUdCChRsBCeufBR3Z8?=
 =?us-ascii?Q?bU1GRCv2edf0gCVhniyIwhuhnbjpbg3AErAWXLcZ6JaFUwDqxcJuVyedl5rw?=
 =?us-ascii?Q?VqQHlgBoJu51UBqmV3wfLMy6Qt99vUGmE4Imt0/Poo9tU3o6EhwjccVnQyCG?=
 =?us-ascii?Q?S4VSs+q00YHQyINLUFpkgoImzvbwhuJTtuX6G5oA9uGlWXL/LAW4cL4QYk4b?=
 =?us-ascii?Q?pwtVRA1k6+ksE5e0tCF8TY3w/3wEuvGSHj2WpF2tKWJjet/bubvae0M52cwh?=
 =?us-ascii?Q?QF4C0IhoDnSs9golXOpKK692Wp92Sw5H7Ve/22vZfm+XKokbdQcQAZIVWoC7?=
 =?us-ascii?Q?EpNwYvT/K8Qgg0vMYSHqS1j8gn1R+qtmw/0sKOFfyRzjD7j8+U/SEf6FBqoy?=
 =?us-ascii?Q?AFew4gPROQ8zkLkE+eB6ORMBUfhh2e90ScqjIPwUZnyY1jMjGrD0oKpKZ9Wa?=
 =?us-ascii?Q?jhVNO2Q9BQiHlfJ8tWy31MhNmyW32Eu2MrRxXI9KzzOAJ5vs1PniW6xzImu2?=
 =?us-ascii?Q?kKcA4krqMXrxlj68W+Z5HAMRcg5Y+VAH2MUMdL+dTsfWQqFl1CeUxoPihWIe?=
 =?us-ascii?Q?UhboyGMXcJDd/j5DehraS4UTDF/a+ScbXBRWLXWUMitBqi8pg4NiZ4f5UsWt?=
 =?us-ascii?Q?dUumfC05WeOWKyPlG4dbC8Vj2yRItUFGGWKM+nn5yZkqzu5qDvdIbcvT63lA?=
 =?us-ascii?Q?LDwCWdA0dCGAuKKh5JipaMve3aoiPzef23FevGJCBsq6X3AM3fwWP279w6Dj?=
 =?us-ascii?Q?LZ6NlQxxakuFaZA1e/x4UJYn2RfS8WFHipAZBdpiz30z6oLI8TgXMzQqpb/5?=
 =?us-ascii?Q?5zabQFEuWx7hyKai6lAVAT5lKorGkIwHzK88TBQqD+W0maxUR8ggTzlRHWaa?=
 =?us-ascii?Q?cAYz0lMN0xza2M+dQXfad11lCYTLD/bCfyn4gaR8V7U7pvj8gzFtCJLgjTh7?=
 =?us-ascii?Q?pYnEgFeqnDC6h94BVXJAUdLIPa6+Z50jNrRCQHehrXN6z5aXeY6TAiwo6sCY?=
 =?us-ascii?Q?vKQgwQVSP0tRJikkhzk0MMy0JKm2le0ffMV0/Zm7wkwLx3dOZl/DvUwxaHGE?=
 =?us-ascii?Q?7KYN9UgoeePl0r6rQh5f+DkvDE5RVUgWGlcDCbCC7n6VC9SAIESOLMkXgwRy?=
 =?us-ascii?Q?Tj1nIM1/5JnT4gmimbqhUknAOBVLwIRaJgZB6BRaWUIMT8/E2GuopTbFxK4p?=
 =?us-ascii?Q?ijbcTdxZF3DX4gyyv8mppiHQe0q/fW4iU07DvBoQEQ0lp4w+5UABjKAWWDYM?=
 =?us-ascii?Q?1kUtHPXVlzhEPDP/s1Uea3qPWmlePRecdXrzejF1NssI7bj2Oyf58kpdfJ7c?=
 =?us-ascii?Q?5nadbb//Q2rVhL4EviflkyzoqLKpVPQJQZ6UjIi7fkNOtUkU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PBY0KJnJ9FhRu5y850rTr9QEIPuIBWPDCaDOvu6n4lrbZQrddebN4sAGgo8zKdmaBrQVPf83haAqUlz3BdlJnIjg+POpT2MdIiJUCq453OIwdGogpgZX+dQKQddOU+3bucC10d44Gxuq3prrT9AqiaLk1ErK/DAiNiXbwR4/d5h3fPN24gnCvYkGqGpbJNI89AYaIj5aAGe5l7ST7TEnUg3fee/WFx5KiZG1XFM5sAZT98d0mNEfXayx1NHOEXzhrvosfECZlv0JZ3mibJ77eXPL89ZLk+s/PGxEAqotEQTBQxdk8JTqsWSE409XC5Nz3d0UexdbQWV9I988Z473Rw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e165bca-b52b-4279-2baf-08dee621b4cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 05:42:37.4520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4rBm4RztdTMfTheQ1gihFS1O6NXmiHuGAp81xnLoKMcaGIUSEMlfTr9wcWDpaxrxFCMXnubtn99vN8WyHZDwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: David Lee <david.lee@trailofbits.com>
>Sent: Friday, July 17, 2026 10:58 PM
>To: Zhang, Lixu <lixu.zhang@intel.com>
>Cc: David Lee <david.lee@trailofbits.com>; Sakari Ailus
><sakari.ailus@linux.intel.com>; Linus Walleij <linusw@kernel.org>; Bartosz
>Golaszewski <brgl@kernel.org>; Dominik 'Disconnect3d' Czarnota
><dominik.czarnota@trailofbits.com>; linux-gpio@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: [PATCH] gpio: ljca: validate event payload length
>
>ljca_gpio_event_cb() ignores the event length and trusts packet->num as th=
e
>number of two-byte GPIO records. A device can provide a complete USB messa=
ge
>whose nested count extends beyond the payload, making the callback read
>beyond the receive allocation.
>
>Require the payload to contain both the count byte and every record it dec=
lares
>before iterating over the flexible array.
>
>Fixes: c5a4b6fd31e8 ("gpio: Add support for Intel LJCA USB GPIO driver")
>Assisted-by: Codex:gpt-5.5
>Signed-off-by: David Lee <david.lee@trailofbits.com>

Reviewed-by: Zhang Lixu <lixu.zhang@intel.com>

>---

