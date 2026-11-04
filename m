Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801559;
	b=xP/5TBVayrkem9cvzPqPd5F9ls5W8KsM15JvMM6M+13UbQs29JQ22zTIoLasmn6W/8BA
	 lG0B2UCUIRqHgWsSXaMbSvBcox2XLSNWh057HL/0/IPtP7G5bl6G/j9XCGQX8znICID+l
	 x9Zol4meUWxeBOhyJW7YsqXGD4HqI0A/dqTjg9Kkj4Ep36VdCvtg+iOSxXjh8Df6a7zK7
	 TNPCSZEV+ZdcEBcYD9C9z9uVwVHvXEpTxhIy5Th6UHSV+Y+FJLNT6ckEpw1QgVm0gzOKv
	 6BCOUwm8/JpK5yZJ67iU9wCX45a1B/XY9P5d+n3ty+2yoJAzezXP0N2Qdy9BzZgnr6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801559;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R/qTYP1R+kSpV2jgLC+P4WluCtiADqd+MVp0Uzz5JAU=;
	b=tL004/9um/0O6QBgozrl4XhLtPxHaMD8ldTjQ+xUgTdYfL1PHpr5BkokGgJ/aCYPR6OX
	 2pribSN17NZmet22wzMISXZ3x5kGyawzF2kVKDyvoHZti8/Mz6tV2a83plH6XRhawyW67
	 B5VYfsR8ymlinh1ezWrdeJ9exungAGt7NWZ9VSO5fZJxu2aJR91Of6SVQ3e2NzcQT3Tdr
	 KGb7YCvvCtaFfuSi7N66Yjfnt8Yrvcz8Xxh1O5nb1rXXZwZLgH+rDT/c0dJ+2V6EuP6UG
	 lpfIpWulxrj+xTB9bSGB+puNH9AsB3kQ8ARA/FfoC21vnEIjNqCEtFHAYAPiMXtH7QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STApIEX9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2914D606EE8C;
	Wed,  4 Nov 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STApIEX9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEEA1F00A15;
	Wed,  4 Nov 2026 14:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801559;
	bh=R/qTYP1R+kSpV2jgLC+P4WluCtiADqd+MVp0Uzz5JAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=STApIEX9nhWevvJ6wRUnBX3jnDILex3BD3LdFeRTX6/RdPAkXLXVoSIGEfd3OKB5/
	 vxyWyl6i9kMTVXeGodZMLN2goOB0Ez7AJiomYMt5AfMFgShTXxEm0MQoIiL4R3n+4l
	 rlCS3YMbrRJDS+ijmK1uyTyAKyJkBPpi5YM86wVzlEuLUhYEeoNb+OsYRm6Dd5Yl/o
	 IZRr+69k4xtytxKKTHTTm+s9tAMFkaUIUiix9OXWqz2tRNFM5BrKSBKEXOmv6Zg3xP
	 ZHneNKDZzU1a3izn0YLssImEGrGg//pLmwqawEvOtS0w5Gq3h52huNpdrM2Vu5Dd2t
	 BrVAqAMdlVpVg==
Message-ID: <sashiko-outbox-197409@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] device property: provide
 fwnode_property_get_names()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-fwnode-for-each-prop-v1-4-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-4-6e28fe1c72c4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:12:38 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] device property: missing NULL check for props in fwnode_property=
_get_names()
--

commit c6de0ca7eaa5586d9db8c473e272baa86e7c8e04
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

device property: provide fwnode_property_get_names()

This commit adds fwnode_property_get_names() to retrieve the list of all
property names for a given firmware node, merging properties from both the
primary and secondary firmware nodes.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index a97575ff91990..7b0df3dfae53b 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c

[ ... ]

> @@ -542,6 +544,81 @@ int fwnode_property_match_string(const struct fwnode=
_handle *fwnode,
>  }
>  EXPORT_SYMBOL_GPL(fwnode_property_match_string);
> =20
> +/**
> + * fwnode_property_get_names - get the list of all properties of this fw=
node
> + * @fwnode: Firmware node to get the list of properties for
> + * @props: Pointer to an array of strings. It will contain the address o=
f the
> + *	   string list containing the property names.
> + *
> + * Return: Number of property names written into *props. If > 0, the cal=
ler must
> + *	   free the array with kfree_strarray(). *props is only valid for
> + *	   a positive return value.
> + *	   %-EINVAL if arguments are not valid
> + *	   %-ENXIO if no suitable firmware interface is present
> + *	   %-ENOMEM if memory allocation failed
> + *
> + * The list also includes the properties of the secondary firmware node,=
 if
> + * any. Properties present in both nodes are listed once.
> + */
> +int fwnode_property_get_names(const struct fwnode_handle *fwnode, char *=
**props)
> +{
> +	int ret1, ret2 =3D -ENXIO, n1, n2, i, j, count;
> +	char **prim =3D NULL, **sec =3D NULL, **merged;
> +
> +	if (IS_ERR_OR_NULL(fwnode))
> +		return -EINVAL;
> +
> +	ret1 =3D fwnode_call_int_op(fwnode, property_get_names, &prim);
> +	if (!IS_ERR_OR_NULL(fwnode->secondary))
> +		ret2 =3D fwnode_call_int_op(fwnode->secondary, property_get_names, &se=
c);
> +
> +	if (ret1 =3D=3D -ENXIO && ret2 =3D=3D -ENXIO)
> +		return -ENXIO;
> +
> +	n1 =3D max(ret1, 0);
> +	n2 =3D max(ret2, 0);
> +
> +	CLASS(strarray, prim_props)(prim, n1);
> +	CLASS(strarray, sec_props)(sec, n2);
> +
> +	if (ret1 < 0 && ret1 !=3D -ENXIO)
> +		return ret1;
> +
> +	if (ret2 < 0 && ret2 !=3D -ENXIO)
> +		return ret2;
> +
> +	if (n1 =3D=3D 0 && n2 =3D=3D 0)
> +		return 0;
> +
> +	merged =3D kcalloc(n1 + n2, sizeof(*merged), GFP_KERNEL);
> +	if (!merged)
> +		return -ENOMEM;
> +
> +	/* The strings are now owned by merged, only free the container. */
> +	for (i =3D 0; i < n1; i++) {
> +		merged[i] =3D prim_props.array[i];
> +		prim_props.array[i] =3D NULL;
> +	}
> +	count =3D n1;
> +
> +	/* Properties from the primary node take precedence. */
> +	for (i =3D 0; i < n2; i++) {
> +		for (j =3D 0; j < n1; j++) {
> +			if (!strcmp(merged[j], sec_props.array[i]))
> +				break;
> +		}
> +
> +		if (j >=3D n1) {
> +			merged[count++] =3D sec_props.array[i];
> +			sec_props.array[i] =3D NULL;
> +		}
> +	}
> +
> +	*props =3D merged;
> +	return count;
> +}

[Severity: Medium]
Should fwnode_property_get_names() in drivers/base/property.c also check
!props at entry and return -EINVAL?

The kernel-doc states that -EINVAL is returned if arguments are not valid,
and unlike fwnode_property_read_string_array(), props is not optional.
Because fwnode_property_get_names() passes &prim and &sec to the backend
property_get_names callbacks rather than forwarding props, the backend
callbacks never validate props either.

If a caller passes NULL for props (for instance, expecting it to query the
property count like fwnode_property_read_string_array()), it will return 0
instead of -EINVAL when the node has no properties, or dereference a NULL
props pointer at *props =3D merged and leak merged and all transferred prop=
erty
name strings when the node has at least one property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-fwnode-for=
-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com?part=3D4
