Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794049997;
	b=SP2X7e8uA31H4GQxUF23WSkK3kKREUrm2WXkPTO1wrB+mERxPMjmWAM7yn12sFAWZJKp
	 viCMQzQEkHocldsBaE+uqaBoA6GvcnLr/CRz+Xtt3rbIleVqW9c+dbiDEfP3ZY8E20szK
	 pd5QzLd8pLTwcub/9UglZDfx6rs4dttFgDqarrKDhew1u/LPH1lMAQUaUKbvote5LnlEA
	 Cx/uGUIDnprzR/4JrkDFUZtPwlVl/hNXVgn9Fyrg191AIX+f4sc9i76J+NnTA/qKa//js
	 OkKPP3kzT+Lt/06i9BrgdvJII3frXakVRPw3mQnS4LHn6ErLODG/GIuw+834oLTsIKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7CfQFlNQ0Wpv/PI/08FuADOPka34n4mC+wkHpFkQ2RU=;
	b=ISmiycgKFFfZBa04RtH98bNAB91pR0z8UD72p5DZwtIkTOtmgOp1lpEyHZP/78m8UAk5
	 NK/XztQiNDfDBBfF+RR96z/o+fyToqAl+8bZkMhBSXfvVsHk+Kv5rWO+rWAf5UxamuKji
	 qWiYzt/nS6kovOMGsgk8XH9w2R8emJi8UrJ9bOQRRrAon+YMTjvOZ+omQKmov5CGE7UpC
	 4dReEMWNnIuvssteK0j0rJo/l6gcUSmroPo4KtUGNjDx9BKPNpU5q1zlrdVp0af1vFik+
	 qKMKE0gaclOpE7OwSuH1Dx4kdnFKAcdovfaCHctMRZr3Bb5b4aLj+kk5jGSwn5D5KNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivnycKhu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4E7606A32D
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 11:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4E7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivnycKhu
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b31fc13124so10437587b3.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Nov 2026 03:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794049996; cv=none;
        d=google.com; s=arc-20260327;
        b=flDWKj1posJ0eY6DLrYXP4qLbBXMPi8kJQqQK/0xCRvjtMY5Ah8QTwQHtOd+U8Rr6g
         RJEkq7OJHhc8e5qcn5CPYcZnXva7BWwPrxxHmqPHVp9AXvhS6QicVkhovMI87p7KhZOx
         cW6zj0EcbL3x3FcqcjgAsuaUHCJek+rPSsL2f4VE8svGC09xKv40pbRtUUfio99I72Gu
         OxvLKgrc/rMiAtYy2Nbo1nZsKoy9zP4GszUEEchgNH35CpUHRg4GEhPbaCYIX9/hfzn7
         RdDu2lMzNETLdPtEGDvwaXn5sdn4RVwhDrYVI9sgYLdU4QCAQKvFgJjnMTzW3lWcU19Y
         bp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7CfQFlNQ0Wpv/PI/08FuADOPka34n4mC+wkHpFkQ2RU=;
        fh=sIAG38CDCk0Dw7oYYguuTpTwamC1zWDOI1XGn3mOTeA=;
        b=CptDm+IPL5DwcGyHC5OMokO4eUNxT0eUf18JztEyU1NQHg9cQtLMOr1fTIYyeaKHl1
         B+VaVJi20Q8Ol/LH3T/op4m7BgSb72sKw0IJWHJUR2qF7KHVrmOG5AH0qqoRSO9+Mitp
         AmjGEj33OoKn5jGkciK6Z9ocqUPgGBaNZ+K8RTaZmzbHKXyozAXcUtXNzcm0yw46hzSV
         pM8T9OPcWTEuLEHHgjfPn7eX28SvtN9DPSw1R6AlgzU+QPp+Mk7ERjvWmGrxqSxM21Pj
         KMb/g4yanP9agls258AofpWDa3Td2Muw+VXbnr7MS0rXtjT5cKSDW+D63oqtiwg+2h01
         imkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049996; x=1794654796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CfQFlNQ0Wpv/PI/08FuADOPka34n4mC+wkHpFkQ2RU=;
        b=ivnycKhuAxWBrnQWYSCvqMA4+zpotiW8esslbkodt4qvYj9ggQ2v8rYs4fK2i12qXG
         maGQIXpdSi575tzTx7jB3P7BFSoWBXBHxgOy3B/oyzbtJd5ZCvd9KN9nvrhDKOgGMpuK
         0seZO+NPFfds7I8AreR4quObnpKgi7Kps6MSBz406mUacLX7PRCAwyx4hNyPjm3GoiGY
         G/ZrU198q4ZqSfuUKbjppXr1DyucCvYr3G/quNSLuN+ehqbVYrrmIl980RxctPX5rgv/
         xwUaU3hEM7QEaVOgan57LdgQJ6qcTFmM/eqcQ24BOU5yfTo2KA2QnGP6lZNyGtZ1DxiF
         rf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049996; x=1794654796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CfQFlNQ0Wpv/PI/08FuADOPka34n4mC+wkHpFkQ2RU=;
        b=1n6dF/o71rbdO9h9ejUBZt2S2TzcfYlHzNwvDHAETEsVlhxBxKsozeh6S9rF1Cie9y
         UWlzWy2W2jcNXExMK5zMsvUJZHl/YVc4w5i0IrACQWGU/9o4RY0719eepdLcD/0MMhxz
         8Nnz+IxOCa7Urz1eX6zTTEk/aj/UWL+kLDxCdFVOANCGQLQ4z+Cfh5fGjP8f2rBkI9o7
         j05FJcD5dfJsygPzOUpUM+8c/N0wzSMyS4xbI9ikBUccmsM/gl86lmiJlw1sSBJkFwRP
         GsuUICh6bq+87o3941G7Y8oC2LUdoaD39ydaTsOViYOJaVlJGzOrvH/Qwj1oH/hCddYu
         uvfg==
X-Forwarded-Encrypted: i=1; AL+hErGRALWjZAzcMAoKF2lOmSMM2uj6t6EyOPjS6GRRbT7JUX33/rEDPsykfFHC9fBoz4YN8rc/15/P6tgt@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZIR4q9hmkXBthgP59MDE1YBN6gW/dXCX/UV4hal3OeVn+fwsu
	sxw/C3bOSlmahL+ch8Fca3ZISt/RGXOf3whPpwe24TZP9IKEMpmkgTjjPgJDmkZ2K4EqaLbaJTH
	3eQUDMrzmNUdcKnErdynrdYGPfN9paWo=
X-Gm-Gg: AYBFou0N7xsvXXgqcI3PaNwW9hDftcqjY7CkZ4OXdueUfJNEG7ykaNXUhsAWTJ3pGD3
	Fn6qcc3SSiPXq/14WqC7XilrGP48scDgpeDE0QITSP0ZcjqgWtnE1hiH0FIv6y+UIvasLiqtrPJ
	muLV0tCvLSLy0BbG6arfmo8zdcroJedO7zzdy22hE2+08WhQvXE/8xGObu3Aj7/MTEM7hDZFCCc
	1JJ1ia6iCdh0Npf93evYHxilZX8GhniwscP3ZwS7Bta/WMoorW6O2yk0mtECwM+sj0cl1DolkJk
	v2Hz2bFv1yth8fnDLuU368uBGdNLfBJypNUJ9VNo/cZryeso+oRBbblAxIx6kT3XMExGsHrEce3
	oGShsautZkDkJcEeCMhBbL9PFjpdSnmAeU6QlgXM2j4U7taPvtc0uVG1euwow+75d8sKLdP68aa
	oHinHPXamyG+WJqQKy3Gom9PxgSbFoeyWJ49NlKpT5RlaPMtvKWRx4n74AAczh/osdrgwHxpKvZ
	ZivEQiwmwU8c75sdLeWTq3jtAmC/aX4lQLrqzDb28qmF4N1rK6D6dTkJpnTXA==
X-Received: by 2002:a05:690c:e3e2:b0:8b3:1fab:fbe2 with SMTP id
 00721157ae682-8b3419a12a6mr35202727b3.36.1794049995845; Sat, 07 Nov 2026
 03:13:15 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
 <20261105-b4-gpiolib-free-v3-6-bb47ad58642d@gmail.com> <CAD++jLk+EfkLsHCyY+O6Om_xTEe2dJX+cscDLqW+TVM2f_V8qw@mail.gmail.com>
In-Reply-To: <CAD++jLk+EfkLsHCyY+O6Om_xTEe2dJX+cscDLqW+TVM2f_V8qw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 13:12:39 +0200
X-Gm-Features: AclHuK8EJ5-TX-3H9n-_URllAt1JXIUxUWdN7PJdZa4KHOlR5un4fYeASzixMP0
Message-ID: <CAHp75Vf8dd7N-9QvciUQ7Wug_JY=Ru4_CGvhSpA+-icx3z64tw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] gpiolib: avoid krealloc() in gpiod_get_array()
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 3:56=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
> On Fri, Nov 6, 2026 at 7:30=E2=80=AFAM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>
> > Instead of allocating descs before the loop and reallocating it via
> > krealloc() when candidate hardware array matching is detected on the
> > first iteration, defer allocation of descs until the first descriptor
> > is retrieved.
> >
> > Factor descriptor allocation and fast-path validation into helper
> > functions gpio_descs_alloc() and gpio_descs_check_fastpath(). Inside
> > the loop, acquire the descriptor using __free(gpiod_put), allocate
> > descs once on the first iteration, check fast-path candidate
> > suitability, and transfer descriptor ownership using no_free_ptr().
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> The kernel clearly looks better after this patch than before so:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> > +       descs_size =3D struct_size(descs, desc, count);
> > +       bitmap_size =3D BITS_TO_LONGS(max(gdev->ngpio, count));
> > +       alloc_size =3D descs_size + struct_size(array_info, invert_mask=
, 3 * bitmap_size);
>
> Nitpick:
> I know this is not your code, but if you respin try to add a comment
> here explaining this 3 * bitmap_size.

And the very next patch will remove that as it makes obvious what's
going on. Since it's not a fix, I don't think we need such a
short-live comment.


--=20
With Best Regards,
Andy Shevchenko
