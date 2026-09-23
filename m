Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B3252E07F;
	Wed, 23 Sep 2026 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=44.246.1.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169199; cv=fail; b=h3uLGY8TzQwe7Y9yzA6eiO6KJBwcgH1F3dH1jd/qaFw+zxNP7wBBvXu9qcqKMKmnec5jUOK0hCEDvRELpljsxYeQgZik/o4v/WajBHL+H+EeSx5qc1CSOxBOTwoHK1gidmhtpSkOe/GXgqAzhILxfDObXNnp/cNq++pWmq/BWrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169199; c=relaxed/simple;
	bh=w2hqRCOs1FRnAKz2s6K6YgfJodSZiSzyjtQLmisIs7k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZSb2/YeAyx7DiW7zwXaIr7YY6hFjisZSbAonlKokp94Mwd75OoaOsrVgsKqJ47vMNUkaH1234r0DxVyPclHux9iJQKpVqQrkNbzItcMcwP/nZKakxJRvsxkn2HUKN4XDZHHNakqOOgu5aFbN5P2SuVWH9mPUJaJjirSgZ4PTg9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ehjIwgiO; arc=fail smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ehjIwgiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790169198; x=1821705198;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BWEIj0xh6osCsfK7HHwylodNHNlcikd1BkITodAAIW8=;
  b=ehjIwgiOHAfNZF/0qMrQy8wbll7AO/+16K5/nnu++3ZnCNru6MMq8rsg
   bVnD/GzFu1ttRIRkSem3Emhh/QDuRr1c+kk7Bu6b5WGex7ZmD0cicfWhD
   wT06c1+IOhEFtGnmKT1tXYZzwI6YnCnu0RXAYkCvGm5TXxoNHrHT1WNrE
   1ApdCjNTPjIy0wUTHDkp7VMjP7quva384i2s3XHjoOHyJKPTd/ieOya8f
   g7nFBhCkB94uF9SQPJ2Sm5Kn8aXMgc6ZqGSlFKNoNT9sPpgFinCwOy4zc
   k3VtD9FHipemJOun4sf3ib6Xkvrsfx6fCaHeF00sQQUwQxo00sQyvFTvK
   w==;
X-CSE-ConnectionGUID: pPo+PqJLT0eGxvCK8SD2Rw==
X-CSE-MsgGUID: XJhLjLPgSMiurObNeqfR2g==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29438056"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 13:13:15 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:8173]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.18:2525] with esmtp (Farcaster)
 id e01f5bc7-e49b-4b5d-92a4-61cdc1ff6ac2; Wed, 23 Sep 2026 13:13:15 +0000 (UTC)
X-Farcaster-Flow-ID: e01f5bc7-e49b-4b5d-92a4-61cdc1ff6ac2
Received: from EX19EXOUWB001.ant.amazon.com (10.250.64.229) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 13:13:14 +0000
Received: from EX19EXOUWC002.ant.amazon.com (10.250.64.172) by
 EX19EXOUWB001.ant.amazon.com (10.250.64.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 13:13:14 +0000
Received: from SJ0PR08CU001.outbound.protection.outlook.com (10.250.64.168) by
 EX19EXOUWC002.ant.amazon.com (10.250.64.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Wed, 23 Sep 2026 13:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JS/DV5SwhIf86vhQ8z4M10tf6bL20OHF1gC6GI8ugXoqMNOMfNM++OHsgeG0IhQrTG25HxZ/YFTB54qXekFyI3frhKHgCMAvWJIhKIEVuM7Vb37uOHWx9Ud2Sg4QTGWVd5Ms29a9ZeSGYHagUJbazqm5I0kvz66ez00pyvWR9Cl3znQu1VgNgoYd+GmqB2pnusX/yPvZPrW8Db6IzUAtJoo1uLXY5Zve7mC/9H0Qa6pfXdV/F7vyHctXTJ1Sm8Au4pprJOb/8RBjhY93P8Ml5EhPt0qUYJnOqz/Tu9CKOYbSZmoRLsMzpvUs6UVUJ3vIeztdXY5XHHPN8ZNrvq2cIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWEIj0xh6osCsfK7HHwylodNHNlcikd1BkITodAAIW8=;
 b=NbvcX7y6HdrlFpMcbDBmH99zSN4vdbWTlFjn/ZnwFpwbDRC+iWqcG2Ux4U9dNl+/5JElyGYwduWbyaenhadqVIInDudtgmcYW+j48EA4vuKwtrNi+Zkbx7B7fh59IFbuO2DOW4bjuphGy7QCGSpPGMq02U3axqdW/mDf+AkVcBbjqnJtLbJSyey8qK1JyBzm2FQPYP7wh53K7fkkSwSfekGdGDeuSSQeD2nx+aL3WO43JlANJF74govCGciuNUYdLT+n5tR+ik354O5IjXobjsgWyQQn3Ob7tN8EyeUip/uMKXaPKQNrknXM3Bj2VUFGwoDVo++OXdhs2wXPFCm+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by IA3PR18MB6163.namprd18.prod.outlook.com (2603:10b6:208:526::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 13:13:10 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 13:13:10 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rob Herring <robh@kernel.org>, Rodolfo Giometti <giometti@enneenne.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 3/4] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Thread-Topic: [PATCH v5 3/4] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Thread-Index: AQHdS11HPl/d1iMljEuOyfwYfu7vGQ==
Date: Wed, 23 Sep 2026 13:13:10 +0000
Message-ID: <BY3PR18MB4722A1298789CA9897B834F4C6822@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
 <20260922103051.5257-4-farbere@amazon.com>
 <67e6d618-f94e-426f-aabc-304078fda5c2@enneenne.com>
 <20260923123605.GB27237-robh@kernel.org>
In-Reply-To: <20260923123605.GB27237-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|IA3PR18MB6163:EE_
x-ms-office365-filtering-correlation-id: 3ee02776-249b-4275-7b50-08df19746a73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|38070700021|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003|3023799007;
x-microsoft-antispam-message-info: hDX3aykv5UnGTFEvCxQ+rzWYd5G3zY4Dvjp09eKmeQCNncWlB79PyE21yfNK2c3Wddr+vkU66cjTD8xvr9Ppz4PYNEXt2kgBRwyj43ISnCI1HFLV5lHYhJNm7+944nVtd1N6mzSy76U5WsBzWEQSRhNuN4daGh3Sy0LtVW6XWsktK71f40n+qSnlBron6rTRhdcyMxy7589o0MYV3wD0O7S5pyUF5h/FwPdqaCfcnd0Nyp2nYf9cR053+rH+cFJi1qgHgtIQaboi6KldGjIy/FL0zVFxgSkAAfje720yU55j3pBiAPTHgUAspuGEYJvu789ZwU0/cldWYvgyzGzJJyfqkjjTD760FT6xte9dAXF7EENzSOiHsNXv/UDtmhkB4cR0y8oZXs1VopyU+4hX3n+WQdmJWoA74HioLRbEm1bAaSDTg8voIXe0ojk/4mPhybF9cbpGOOy74tWinMYhjsiIQ86moLQotCoqOo7KLcatOoxgABEy4tcIvLDm2zLUw6lfpHCG7UDeDyYEFobVeDHolzqsM5FbTP+uaU95K3Y3bmBw67pJrRqs6o3khzSrLYUzYgOJIwP2oZ7oZp+O8VNW4QmolLhzwAO8S5U5nTuj2ZWf0h1q+GyCZRwXOLuqh3t75VhPjYa0NB7r98agPk92/+NTObflRJdJDIyV4EAtGgG6Y+yqncZb+s4vXUYFjtfDbV03fyZSFjYUP6HN/QksaXPnBxxxEAiQ/vWm3qk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(38070700021)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LH6WTDy+dLi4cysmZU2B9Q+Oau7WS7hWXBg3lYdgTTQ33Om0eYNOYuaE8xXY?=
 =?us-ascii?Q?Wp36lTKTDKsqACdLRKRGz8H5WIFWouQrap7SbO08oyIyJ/O9BA76/ibs5H6F?=
 =?us-ascii?Q?Ip9Qt0XcnOBn/wMe9eOUdUUKfmBfmk8NL6Qu9cEPBfp05q0BdP5xA/qbkfxh?=
 =?us-ascii?Q?xTpF3iA/WNgtIJzPHMuhXKOauTi/TuK2g94O+u7qi3WKY31MmVsejjWi3A3f?=
 =?us-ascii?Q?icG40zeUAszVZi7zuNvUtBsFpNKUvF9Qwc/qn8h99Dttu3OwQ2GM/XkKao7k?=
 =?us-ascii?Q?63hJ7S/RGNitsnyD4qE3IsjVIF23YFq9FmyluqStXoJtwVnhREaF4YrEeHvE?=
 =?us-ascii?Q?KjL1NKmwl7cTh1LqjPn1Q9wVxVEPhEpUA72J20I0gik8CffNsMW4dPEsSOEX?=
 =?us-ascii?Q?SvVzlhp9uen+wVQveYmjmvW8GeU2xJj+/+td432gvcAaLxwgzi5Sy8+7eeW+?=
 =?us-ascii?Q?7cgSmrNPGDAYMNYxQnSLGcuDO+eU0xQsbq8slfk/94HJN0vV08OeCnilyh1q?=
 =?us-ascii?Q?ZSNiJVVZ1yli67f0SIH0IqvAPj04uVH4CUmh7QvkHAXC2sSc8A8nMVuB9Dpw?=
 =?us-ascii?Q?wQj7+sX6ioQTKxlssid8I80O/BkUYPeVPN9YWHWdgYhHSy57U0OT+5VHz51f?=
 =?us-ascii?Q?1dYADmdyDduGWVcg8g7ffCKD7NSWGgBrszjTagYGrPbUlffg7co4Ede3Jrmc?=
 =?us-ascii?Q?+kwYpFw+3LG/qPnn8EkmEHAxZtsk+oX9Ckh0oA/NFx7k39LjKPmC3KZUgchg?=
 =?us-ascii?Q?RB6mK6eny7GqI/WFb9JT+Hj7hV7MF0GtJqrn8nhzsvJ4mnqyOJk1+2foRuNX?=
 =?us-ascii?Q?YvDtxxhueYLd9zamM+HkP1Mhv2ugF2uYhczcVOospv1g/Af0HDcAbgMBF1+s?=
 =?us-ascii?Q?XIrNjRpbtWKM67Qp8y0YMw5KxAaV8+6cuBv292JXGpCznc8KGkk3YmuQ+QgH?=
 =?us-ascii?Q?XJy3aaAnzC5SsMxZbCuMrpeOLVNLu7dS717tjJYmvVR8JNeGIkQZN+ZbDPT/?=
 =?us-ascii?Q?agn9xbsPCkorEp9HnXxGBpHz4tZLupT019MQ04tLEg5gW9XxYuDwZjTwSF80?=
 =?us-ascii?Q?N8en5NRLgReComPJihLsSmaWIDm6s1ZtKR/h8l+3ZlbyyjwePYulEzjvXJKP?=
 =?us-ascii?Q?TWslDzMiUNQCqmmjx09n+cdr3uuhtj/7MBn2cXnHrZ9JH7gOOM+n7XHyLLHo?=
 =?us-ascii?Q?FhqhVekLHIvYWn8NxYsLnn3bQ9J/OrjfsPDXhuf1Zyq0H6uZO0IhZAQG0gpt?=
 =?us-ascii?Q?0jnJ61SaFxUxDqeu2PEsR3iP9RLg2rl9qe2AKc044V3Zia7QWdWVhHHNSAKX?=
 =?us-ascii?Q?yogtkEJK0+FRPTkjRgPr/Diztg8pMbBDt8//VeHauyYu8nHxBsOiFG4TkVZE?=
 =?us-ascii?Q?T9Ij83B4vWqw5i5XmQiaLyDrAiNXTYNKQTlzGy1K2/4hH5YdrsCy+TSVcrYH?=
 =?us-ascii?Q?VvNIAntSAk26mApsrcm7XRdXrlu6ElaHWZp1QVS6lbdCPvb+s7k9ShmLdHFW?=
 =?us-ascii?Q?pPkOY0Cdzm/3mAYGhR/aN42QV8hAsvpCP6x+ys2Z8ZxOZjs8Y6gBH0qSCeje?=
 =?us-ascii?Q?U9jjR8LgNUI12UU59a7vbHuVC+hn7ERKvw8nRAdrfcHcfoYwGnTpYMVo33IG?=
 =?us-ascii?Q?Qh40WgQvS0HmCTB9miZUI5QtGYAi+uyg4BAI/TJ/qCpyyfN9cZFCC078kGMw?=
 =?us-ascii?Q?9YlzkDknlfcONu7J/u1KF/k1yFQOsLSAKW5gFdP0t5wpSjaz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3kfn/JXstoJBKV+TL948rZboU+wS8hio6Gp7jlXbsu1O0ILwM8vmqlQMXw888DHywROiGE38eQi2zIH9Fye8E00W+ZsUtGpulenmN5kJqe1yLflZTLq+PE7jc0KMnIDIxSAcMPIwnh3yYPfCnu7M8Ik6IFghZ6JzDT5T/KEjuQhsjng7gFAjd1KgbN5RFXVJ6GzRrHzbXEmNWJtUc6xXZs5c85AWL1F4Baa+MRgfCFBM61NJFZ/2EEStfMSPtJAY+ClxRyWicfJhuY+MmMRFY7Tc4Io4vqqa0u32E/ok1spMuXRiJBquZZWoqp9lv0FpospcJXpS6//TDgqAbRGT/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee02776-249b-4275-7b50-08df19746a73
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 13:13:10.2441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUoUC9k8wG/POzuezoCYxqW0bIiDB93PJUX867TDFzgSr8Eiy3r95dyquRUMctjrUpUwW/47cgVnr02oA+LJIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR18MB6163
X-OriginatorOrg: amazon.com

On Wed, Sep 23, 2026 at 07:36:05AM -0500, Rob Herring wrote:
> On Tue, Sep 22, 2026 at 02:46:40PM +0200, Rodolfo Giometti wrote:
> > On Tue, Sep 22, 2026 at 10:30:50AM +0000, Eliav Farber wrote:
> > > +    minItems: 1
> > > +    items:
> > > +      - const: default
> > > +      - const: inactive
> >
> > One observation while testing the series, entirely a devicetree call:
> > dtschema derives maxItems from the items list, so this also caps
> > pinctrl-names at two and fixes the order --
>
> Yes, that's exactly what was said was needed here.
>
> >   "default", "inactive", "sleep"   ->  'is too long'
> >   "default", "sleep"               ->  'inactive' was expected
>
> Well, that's something different.
>
> items:
>   - const: default
>   - enum: [ inactive, sleep ]
>   - const: sleep
>
> The common pinctrl-names schema should require unique names so 'sleep'
> can't be repeated.

Thanks. Just so I pick the right thing for v6 -- do you want me to
change patch 3 to that form, or is the current

    minItems: 1
    items:
      - const: default
      - const: inactive

fine as-is?

This binding only defines "default" and "inactive"; the driver looks
both up by name and does not use a "sleep" state, so I had deliberately
capped the list at those two. Your snippet reads to me as how the common
pinctrl-names schema would accommodate a "sleep" state in general,
rather than something this binding needs -- but I would rather confirm
than guess.

If you would prefer the more permissive form so a board can also declare
"sleep", I will switch to it (with unique-name enforcement) in v6.
Otherwise I will keep the two-entry list.

> We don't even require pinctrl properties to be documented. They are
> implicitly allowed, but good to document what users (drivers)
> expect/require.

Right -- documenting the two names the driver actually consumes was the
intent here.

Thanks,
Eliav
