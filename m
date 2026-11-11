Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428094;
	b=IeN4462V/YtzGDpiGpDazxv5H/awb97VRE1Ko1ieDTh/WyQWgv6SE4/S/etAgW2pHIeP
	 +KcBhOVO9JTNWRTyRqzeOI83KeW1yMb88YNG/27u+Wf1E57GXJnRk2c/LZzDtZIEKreuU
	 006hJKKGzGvAC7fZo1G8pFBWT7+wflzlfk9YswkarbnHTughOtsrj2cuRrVW+0/svG5M8
	 nmG3XZ2+FRP0TkHb45Qa71KiU4NOCgKxVLfXTTBQuMNVeWeb3JHvnb/S78qKa1Vobrc9+
	 /wIM4BCdypJhnjv6tB5HHHKFTe4mXMKQIACmvaumwvcRnEjGXlZXCIyjA1lZy29KbNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428094;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iAAACyvAYYoTdLd+Zw42qeec+ticUjzl1+7QZgeBkRk=;
	b=2RPJIHrJfh9xn/2fmry+of1MnAVgBbuFIX7YEQt3JbJwYKFalWi/H+Pn99bddH2ZJPuq
	 Frlg7NBbxcxBDZ6nAl8Psic4zaruBD32A0vstNl7LEU4xlkNMciCt26eQMgAsYCSnsCVR
	 KsjGl9kdZAS8iMwK12TNinqciybPH6uf9CjkvFFVm3m7LZOVTBMyALQmA0++LUBsT4EIr
	 rVgWSBzs8UQybtS9UY82tTZiWgPH2NuetWaQc7l8G/j07pr+nTTO+EO7AdO+2K8ElsZWs
	 wyDPgeaR4DnDAoCkdyFP0B+5SAssFtv318WoNZQ624GDqqL6HsIQAHi8mssLXnVtNIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCt4G8ar;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AE4606A31C;
	Wed, 11 Nov 2026 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCt4G8ar
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089C31F00A05;
	Wed, 11 Nov 2026 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428094;
	bh=iAAACyvAYYoTdLd+Zw42qeec+ticUjzl1+7QZgeBkRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mCt4G8ar0Hr/+Gsf5t/QikFo5uAI0mHfuscZ75f+R8MTf8JjH9ZbjRVBajNTE32w0
	 eTQ8g+B44iTlqGEcYpoBiK2Av/KdJhgZ+nJYk7lWyj6F2a4rP3rW0aLKrRtBn7yOBJ
	 KyZhap3uXbM0LTf8dss+Fs1iRVc6JUYKTjdqqDI9o/jC3REJMIEHGRri9Fnuxmm5kt
	 v4mSVQMMfKYniIYPhg4ijim7qSFREWe8Cd/7vJ734kvQYZEQg/rieT+BKj3OYegenT
	 xjbz1QKqmViu0i8+/8c64yqdjYkDMgdcAZXfRmOtGqdPPo9oQF1mblxx5ujGE7VBmu
	 A389XlP5GgbXg==
Message-ID: <sashiko-outbox-209623@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] string: Add strprefix(), and deprecate
 str_has_prefix()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <a74fabd985a874da7556ae1601053b4bcc100f13.1794425425.git.alx@kernel.org>
References: <cover.1794425425.git.alx@kernel.org>
 <a74fabd985a874da7556ae1601053b4bcc100f13.1794425425.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:14:53 +0000
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
- [Low] string: malformed kernel-doc ReST markup in strprefix() return
  comment
--

commit 8eed33304d3a2d7359bd34313832099b3feee074
Author: Alejandro Colomar <alx@kernel.org>

string: Add strprefix(), and deprecate str_has_prefix()

This commit adds the strprefix() helper returning a pointer past the
matched prefix or NULL, updates str_has_prefix()'s documentation to
reference it, and adds a KUnit test case.

Link: https://lore.kernel.org/linux-hardening/20261104-fwnode-for-each-prop=
-v1-1-6e28fe1c72c4@oss.qualcomm.com/

> diff --git a/include/linux/string.h b/include/linux/string.h
> index 5702daca4326b..ec6ca50599fed 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -533,15 +533,33 @@ void memcpy_and_pad(void *dest, size_t dest_len, co=
nst void *src, size_t count,
>  })
> =20
>  /**
> - * str_has_prefix - Test if a string has a given prefix
> - * @str: The string to test
> - * @prefix: The string to see if @str starts with
> + * strprefix - string prefix
> + * @s: The string to be tested
> + * @prefix: The string to see if @s starts with
>   *
>   * A common way to test a prefix of a string is to do:
> - *  strncmp(str, prefix, sizeof(prefix) - 1)
> + *  strncmp(s, prefix, sizeof(prefix) - 1)
>   *
>   * But this can lead to bugs due to typos, or if prefix is a pointer
> - * and not a constant. Instead use str_has_prefix().
> + * and not a constant.  Instead use strprefix().
> + *
> + * Returns:
> + * *  @s+strlen(@prefix) if @s starts with @prefix

[Severity: Low]
Does "@s+strlen(@prefix)" produce broken reStructuredText inline markup in
the documentation build?

kernel-doc expands @param references to **param**, turning this into
"**s**+strlen(**prefix**)".  Because "+" is neither whitespace nor closing
punctuation, Docutils does not treat the "**" after "s" as closing strong
emphasis and renders literal "**" characters inside the bold text.  Adding
spaces around "+" ("@s + strlen(@prefix)") avoids this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794425425.gi=
t.alx@kernel.org?part=3D1
