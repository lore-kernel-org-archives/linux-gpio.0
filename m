Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801890;
	b=OZntVfSFjFZ7HalM8YWc9XPrcqnGPmlbfItyFyBDkgQZy5ZjeiAjZwqTztgpOKRccUIP
	 uz5pCwh5HpsMNAmqJ6GdffKl6gfstatb0fpiMowlWAVKXz8a9TZ4z3Rpr0/1oR4P8Wxy3
	 dAfKMNLMNftDcyFXeIk7zAZaHkZqbp+EdOXS40cUnqu0eRAZrrKyRrdHCMS3iAoYKuRGh
	 EYbtwZ2AWjs86ql+Qa5ELhJTFUs99Sxd2JfkBIuFPiX3n7+STakZVVFxmgc7HsBFfiNyq
	 pET1ZXdX8otgOYUWiLv7/zt3uPbfeg7xvLsiA+zeWEB2zN/dl5f5AmWR2VvLrJt6sSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801890;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HEnB2vagbE+GQ4HUJUIxSWiabg4KfDtQr3zgSqFbaGM=;
	b=lQvHt2OWPci73FdOzCMNae8zHs7Yi9xp5EcJPDFmF7QRTpmzByfaVgkcVPRPG8Zdanw3
	 0q2ArWkZudvELK8wawJOua9cIzhtqsIXqbbWbiBqLo3KJnJEN1G9ebIL9QfHvCYKs41n4
	 vd+xd1Q9648U0KuS18akMs2yvqNauDEWeUCO61GYSZ36m/I/qe4Fspg3EaPTQiQDZk+2x
	 GjxzNgrkFebhYn2FAc7nGrwDdnGuqSEPeB54SHXyeHdm9DVscBVyi7GZLMW2N3+qLQ+xk
	 buwpqRetgNcLT3swpZfKhYBXiE1ScaedQ/UheY7ISWXPoucjUIfrtH4VAWNxVuCq0vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XXMnpipK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720A606A32C;
	Wed,  4 Nov 2026 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XXMnpipK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4549A1F00919;
	Wed,  4 Nov 2026 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801889;
	bh=HEnB2vagbE+GQ4HUJUIxSWiabg4KfDtQr3zgSqFbaGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XXMnpipK1aXyoY/jZmgT2QO+t92lTUpyhLBem6klw2e+0JALe3skFHvtvfz7jAbW+
	 KNkXhXKke/Qw3WDXFYtGGH6myhnaHyXCNMD4X9zQollUoq0tyGyZ70VYbhuid9boLL
	 nXSUGGA7lkdVCL7NuRM2mR+7BJo2UBjr2NM8G/23CSoiRZYBe6tQcJDo+l8VFa6Y9X
	 TIRO/VeBJNYnCFYd91v5Pklm2XWHdgduZrTJpsgkd7zhW3JM7IgFSw41yIEoG5xAuw
	 I9MeIfGMLbHcwLrgaEpFkhPlYcZePsbQUfVo4+NdGx+NGyl3/63g964juIhLUrL8km
	 S3hAVc1OrLTFA==
Message-ID: <sashiko-outbox-197420@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:18:08 +0000
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
- [Medium] of: property: of_fwnode_property_get_names() sets *props to ZERO=
_SIZE_PTR
--

commit 9f35cc327cc9ae6d6d25a8e2fba2753d5485053e
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

of: property: implement the .property_get_names() fwnode operation

This commit implements the .property_get_names() fwnode callback for OF
nodes by iterating over the device node properties and returning a newly
allocated string array of property names.

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 45e55f6184880..16c9c307633bd 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c

[ ... ]

> @@ -1120,6 +1121,34 @@ of_fwnode_property_read_string_array(const struct =
fwnode_handle *fwnode,
>  		of_property_count_strings(node, propname);
>  }
> =20
> +static int of_fwnode_property_get_names(const struct fwnode_handle *fwno=
de,
> +					char ***props)
> +{
> +	const struct device_node *node =3D to_of_node(fwnode);
> +	struct property *prop;
> +	int count =3D 0, i =3D 0;
> +	char **names;
> +
> +	for_each_property_of_node(node, prop)
> +		count++;
> +
> +	names =3D kcalloc(count, sizeof(*names), GFP_KERNEL);
> +	if (!names)
> +		return -ENOMEM;
> +
> +	for_each_property_of_node(node, prop) {
> +		names[i] =3D kstrdup(prop->name, GFP_KERNEL);
> +		if (!names[i]) {
> +			kfree_strarray(names, i);
> +			return -ENOMEM;
> +		}
> +		i++;
> +	}
> +
> +	*props =3D names;
> +	return count;
> +}

[Severity: Medium]
What happens in of_fwnode_property_get_names() if node->properties is NULL
(for example, on a dynamically created empty node from
of_changeset_create_node() or a node whose properties were removed via
of_remove_property())?

When count is 0, kcalloc(0, sizeof(*names), GFP_KERNEL) returns
ZERO_SIZE_PTR, which passes the !names check and sets *props to
ZERO_SIZE_PTR before returning 0.

However, the documentation for struct fwnode_operations in
include/linux/fwnode.h states:

 * @property_get_names: Retrieve the list of all properties of this firmware
 *			node. On success: returns the number of properties and
 *			sets *props to an array of NULL-terminated strings that
 *			must be freed by the user with kfree_strarray(). If
 *			there are no properties, 0 is returned and the props
 *			pointer is not changed. Returns negative error number on
 *			failure.

Should of_fwnode_property_get_names() return 0 early when count is 0 so
that *props is left untouched?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-fwnode-for=
-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com?part=3D5
