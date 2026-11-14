Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670481;
	b=tCgx/ojrGvCha+3dasivVJJWd3AzFVdp1MRCAbSFmi7gwisL1THsr5CN+1d3FJVCvcO6
	 e+649Xwv/ZBktZSSS5IJFn15n2oU3IDPmeQdvWMMcnIn8XQ1OU5HL+rjI5m89FjqCqo5A
	 HrbZdAZkowM2I2k4qfE6FBYlCWn9mowT0ewwJ3i7urmn0bmj5q1DPL4U3vVvm1jnn5GPI
	 XHSsTlEwPV6Qv2KSn8KahK+AkuwTg4ffiSpHTY7RhC0t+R2YZztdS34N32qXKeVeFNgA2
	 OmKxwwbBeCAI+RCDrOi+MRgsTWxvdfLb/z1DHpQv55n04LVaVt83LFQmR5emrb02fqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670481;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=60dwTg4TKvnY9XLU742q4cj6IJnYqSmzij0YB5SJ338=;
	b=dtXxhU/o7k4kFaQIrZQtD2amcKYKoQ9Cu4bLTzFZ4k1mNl217Z8GCr2Z9XFpT1ZVSWMf
	 Z/JeBTYb/yhoNs9R79tfVAasOSOvc34r0BD0IYnq//+Yii6BvZUb0j0H/ZlFt4W4opRAP
	 O3Bivfc9QtHcia2Ia7JzhXNZacLiEMHUNsADMdfrHh8Szztvmab7vAa11kEFFRrNrN2Dx
	 43ShZMVcjpB75Q1lHedS7AeZkr0MYoVrRmVcl65+BHpNW+8fxe04Itwmtfw/Ei/CgUJCB
	 IyHbnEpfhzKvyqbJZzqPdDmXkDMJRAW9GKWOsMUEDByeK8wkyh6ROUIiYxIR2lrYE+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YbGzWfv9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EDA606A329;
	Sat, 14 Nov 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YbGzWfv9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC511F000C4;
	Sat, 14 Nov 2026 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670481;
	bh=60dwTg4TKvnY9XLU742q4cj6IJnYqSmzij0YB5SJ338=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YbGzWfv9r/0xNsoE8GjZlRPeoG9ousVY/Iaet53A5sIb28EMCJZR8fUW6LgN6gnAQ
	 OBaOA1KAQA4W2MNoWTcKJkeo+vAP30qNcniaenqyG8hVQ757d68RMNAAU/1u7A5SBH
	 RRHpOWcl/6Nt8vZZw2OoGap6kZWExRmLIaAOnw60PqUFh2g6fyev2UbVCj+XWBBC7D
	 hw1ubqNmheeQUwx7ALCQlJuF1dugxMOsWq2TIftNmL86GsOh+BGaTlsRilrpf6w0h+
	 N0VsEvh7A2I9PeMpL9w+B9GYhNyPtwG1gkFYsjC77EJCnWMkQRJnCJaUUwy7v0Bt1O
	 BWi0vD55L+1zA==
Message-ID: <sashiko-outbox-214722@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/19] treewide: Replace some uses of
 str_has_prefix() by strprefix()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <95bfed420dd9616707e640708245ce2aebbb6ff6.1794667407.git.alx@kernel.org>
References: <cover.1794667407.git.alx@kernel.org>
 <95bfed420dd9616707e640708245ce2aebbb6ff6.1794667407.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:34:40 +0000
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
- [High] tracing: NULL pointer dereference in trace_set_options()
--

commit c09c1b839b46a18b156e43281c4fb679a76cfe40
Author: Alejandro Colomar <alx@kernel.org>

treewide: Replace some uses of str_has_prefix() by strprefix()

This commit replaces several callers of str_has_prefix() across the tree
with strprefix() to avoid manual pointer arithmetic.

> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 4ccdefb5c3efe..f9f3faaede094 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -4085,19 +4085,18 @@ int set_tracer_flag(struct trace_array *tr, u64 m=
ask, int enabled)
> =20
>  int trace_set_options(struct trace_array *tr, char *option)
>  {
> -	char *cmp;
> +	char *cmp, *p;
>  	int neg =3D 0;
>  	int ret;
>  	size_t orig_len =3D strlen(option);
> -	int len;
> =20
>  	cmp =3D strstrip(option);
> =20
> -	len =3D str_has_prefix(cmp, "no");
> -	if (len)
> +	p =3D strprefix(cmp, "no");
> +	if (p)
>  		neg =3D 1;
> =20
> -	cmp +=3D len;
> +	cmp =3D p;

[Severity: High]
Does this set cmp to NULL when the option does not start with "no"?
strprefix() returns NULL on a non-match, and "cmp =3D p;" runs outside the
"if (p)" check, causing a NULL pointer dereference when cmp is passed to
match_string() right below.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794667407.gi=
t.alx@kernel.org?part=3D15
