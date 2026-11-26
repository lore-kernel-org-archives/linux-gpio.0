Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686443;
	b=NLox/cPqZuSnHjofO2BXqWKGuTZCodz0ekf7FNZ+/Q8NfvbBgVY819WyBCwyq4DfFKsr
	 3koxOO8GY6iFuaubL6JuZ4GHy9BzCnzVJnBloMlgMYb9cgW36qlMed8GmU4S6K9Q6FZBn
	 yqbuHYlWcjrZEOrUJTtLIIKV4RFmRSeko1d/E3zbbsSrs3nTu9EaLBRVGy8KGYKciJvLn
	 zaJzcPDtZnk+DfkM9qZqZqU8blhf/cdtX4J2Vl2K1QEj/ry6w+VteIjl9py3KPff8KykY
	 CvjAygzCn3uzmTIWEEcu6kPCmKoE1mCsTslIMi9+2vi6/XrIsrh+T62ciga7QDpAGXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686443;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qVgS8ILEcBqpc3M17c92dwCW3n5eY4xoNF21f/VxFno=;
	b=cZGZH4lbhH1YDfIGjosu18gxkSYW/8NI6K+Yc2wUYM2lETHQa17BeX1LuYtmbBYG7MAe
	 jTesIzRlILsVK0pS3uu2KGlFbm4/x9o52b6nGwkAf8Bnn3akE5++BKZ8Dyx3buX2Wuinm
	 wtCqXemu9vQnbdGVTNjFtOd42NwS8mzQWhiVtOdHbW5zFUo+Vojoq43vb278Aewj/Yc8P
	 WuJmp78qKYhYzhu4du4A21r8zEV4F7VPdyfsVWe9caIVY4b4IoppW84sGQkSBrxb/M9Js
	 7NrxgqAWwqH+Wnwv0P3O1fTKoq2NBJpGhiQ8OPoiPywyyWNjsKOULgIovElvawxXhyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HLMRe3gR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7F606A31E;
	Thu, 26 Nov 2026 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HLMRe3gR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A1B1F000C4;
	Thu, 26 Nov 2026 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686442;
	bh=qVgS8ILEcBqpc3M17c92dwCW3n5eY4xoNF21f/VxFno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HLMRe3gR+fY/rOzIh5OxO49fSW2CH3xw39C9QFO95Y4Kfa5eIF1ZGWSEIfklT4Y6s
	 9cm4iJvxzCWqYPAscS2iebjTH793baFjkgwmNvuMF3Covgi4TLjLDhZowp5NNdQYFM
	 6vzX65DGHGUD3Y+exOecUFEFdoCMKcs4NEO0MWR3Fu1wHDfDj7b5rsT3171jyeKk5C
	 fCn/IviQhAvc3H16V4CwXOaI8lPHmRCLLT+tcMpTtF2L4n7cpojk9Nm4MHYuvhqCy5
	 8o3VeB8yNt/jn6Z2HpIO13XrKFNmNnVOAVHjfSGpAeUUI9FMpyw2cyUww19Rr+6DTo
	 sCMUYMFLBXJ4A==
Message-ID: <sashiko-outbox-235177@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/10] of: property: implement the
 .property_get_names() fwnode operation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-fwnode-for-each-prop-v4-5-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
 <20261126-fwnode-for-each-prop-v4-5-d4b370ecfd52@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:47:22 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] of: property: unlocked two-pass walk in
  of_fwnode_property_get_names()
--

commit 3a7bcd3a492086f46b1c6bb63542015b4decd0a4
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

of: property: implement the .property_get_names() fwnode operation

This commit implements the .property_get_names() fwnode operation for Open
Firmware device nodes.

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 51db25cbcd4e8..00349e78fa514 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c

[ ... ]

> @@ -1120,6 +1120,37 @@ of_fwnode_property_read_string_array(const struct =
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
> +	if (count =3D=3D 0)
> +		return 0;
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
Can this unlocked two-pass walk over node->properties race with concurrent
property mutations (e.g. via of_add_property(), of_remove_property(), or
overlay changesets) and write past the end of names[]?

CPU0                                     CPU1
of_fwnode_property_get_names()
  for_each_property_of_node()
    /* counts N properties */
  names =3D kcalloc(N, ...)
                                         of_add_property()
                                           mutex_lock(&of_mutex)
                                           __of_add_property()
                                             /* list now has N + 1 */
                                           mutex_unlock(&of_mutex)
  for_each_property_of_node()
    names[N] =3D kstrdup(...)  <-- out-of-bounds heap write

Live property list mutations are serialized by of_mutex and devtree_lock,
while of_fwnode_property_get_names() walks node->properties twice without
holding either lock and sleeps in GFP_KERNEL allocations.

If a property is removed between the two passes instead, the second loop
populates fewer than count entries and leaves trailing NULL pointers in
names[] while still returning count, which causes
fwnode_property_get_names() to pass NULL to strcmp().  If the current
property is removed or updated while kstrdup() sleeps,
__of_remove_property() redirects prop->next to node->deadprops, causing
the traversal to jump onto the deadprops list.

Acquiring of_mutex around the counting and copying passes would prevent
concurrent property list mutations across the two loops.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-fwnode-for=
-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com?part=3D5
