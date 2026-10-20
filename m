Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507076;
	b=1GftFtOHRz9IfB2g7++mp4gSo6iBdmGaTYqQeDCve4igKynTwdk7mPsRs1FoC0CKxztl
	 3H7fUc93YU6aehkydpxZfJnn5p96hIsJlACHH5mlT2pxQoHSTuh7ED6Fw5hVepOY9w2wi
	 qt7rOCjZqw7rV+rWb8crqYoNxKqyM4HmUOjOAiChboc+dH71Hq5wTiyYbHuOdDexfo/dD
	 SO0kZPEBWzLD59Bz8MbFIRj75akPr6ct/EhRbI0tA1JgCh1Sx2uMH/tLf+lRAHNwAnJHs
	 PN5q081L/ENXTssBn2F0wiFXE0wDXW4v2yndThFwwSMRaDf91L5RTmyW3QIJQJBV/ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=2JK7xZsgImwSRcan3EZPTTsKFq682D1+R+A3eQ1HIvE=;
	b=QyK8U8fabATqYNJtphVWekJ5zgQZ7CqEE32b4B6Mnq0+YUCku9uTOfwk65X8IgWMact6
	 EeRVGzVQvUT7jOZomlk/VQHQW/MV3BddGPjT/Ppt2ylLmKHfmYxDqK6UIHInAt8PvYrLM
	 L2AqP4sr1YxMjwbKixCo5WdzFk7Ysfy4f1qk+gw8joVhOmkCqxN2lDII26gzvuykTHN/6
	 njIa1FWrYLB+Vxz+jqiI+xf+c/iDLOJ6fBB8ast+qALMbD/8RugRmHT6dkAZxEE4sR+us
	 ydS1IPlZw4ATpKRNUtnfMP8fz/6YvNn2fZFHrG8OzAa3hGtz7SxF20Z9XRpRfE+HMSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HkSxnQqN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23916606A31D
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23916606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HkSxnQqN
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6774639a8a4so2748234d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 07:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792507075; cv=none;
        d=google.com; s=arc-20260327;
        b=QUuC0zzSdyO36ch/BRR0bTpMG8DLDRz0P2Tu6/Xfq2CIHDpz3CvVUqas7vik2ANHdL
         KfdwCvVzZpY9HpPoxCLb87ghmYYGESNRXaHN3dOgQKf2xjIEA4w+Q3oD7/2X7MxreJeq
         EUIdmL3h8O9FnuI/Bo9RCS90NfPYjb7hJ83x5KeTc+KHbQqlaiW64vD3j7C8ZgzShFOT
         tmyn31njPMHHLHpM5ee2JotB7aGriKKlYm+T50UvUhBqnwq68ovKD3qg16lOULjollj7
         mObTN5wNsPpMQrL81VJGu4G0uU5dnhixTc+jZEnVQ6VVYutOM52JrzG4vwIFk4Dr0WZ/
         XLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2JK7xZsgImwSRcan3EZPTTsKFq682D1+R+A3eQ1HIvE=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=mPUFhzmsEWmMbLUwBkK8mpxu1be2GGYUDg/5S9c5Jl3Y4/H4trBnGO/LhULS5nQ7TA
         aWiEngz0ViVUJ7a9aOz4THICvyhbn7U3hoOGDnlfqoXZdut7osnf32YxsuJpShoymvwh
         rgUrXSNiVcWhTEZCwyhtQMDf/o1C40ZvfGqszopBZQTf6koInkmT+9K3h307v9cyAra2
         pmswkNj17hrraDJctPQeybay32BACUAsmbgV2TT900tWKJ+e0xINeGKzTdSFCRkk9kqc
         PQE57ylaC4TcyLqLTqgWzjVJfapgo1yPbgDt5gwy89DCeKpvB+2rz4z6z3UXKlAwDReE
         m4jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792507075; x=1793111875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2JK7xZsgImwSRcan3EZPTTsKFq682D1+R+A3eQ1HIvE=;
        b=HkSxnQqNg83MWrfv+zJJ1y4SI6yTDJsx3JoFOIz7ZT0D9tcaMlCKbnfcWF8/Dwc+Ri
         +qnW+vSEDv1NnaPyDtmU4oUxVuJ4s7Mh3JIONBIV+hkWedy++4fpib7zpzkEVBf/jAF+
         leUUhf4RrOXfyPsogEZWFcACLmG8M49/Ryg/9+IEzME0Irca0rD22kLfKWITPP13cXPb
         7FwLky4+mbwsXbpp5cgvGB2nR33jb8a0iN2psM4wG+I7vsNp1U1QW9u5A02qZScNfpUU
         qyvQJzM9Wx83FSDDHw7xzgV+pbd4Z2NbBACouXhJpiCDgMWldrskPWJigy9ITeO58T/h
         FOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507075; x=1793111875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JK7xZsgImwSRcan3EZPTTsKFq682D1+R+A3eQ1HIvE=;
        b=VJ4zdSoF9ytYBdpkkPyhI+0RDtb07Ac6u2r22292TgULEO0ujJqKfuKkSchuvv//gA
         rYmBiyyEyOWGGf79tR5i+wdVqJiby5XB5FPhqHF4TmNAJsa1iXycneB+n9buAPOqyFUU
         rCpafzXitFHo46c8UkJDrbL9pPWXQOi63i1KZNNoLUie0s2pyRzdSL9NUIhc3uq5OqSu
         165icuhR4/VMANfzl0LtlDmgK5GV+iP6fKFIh3pZnNA5ImWZgiVpwVcVzAFkIQhG/hbp
         mcFpCRDSv+zvgjgruqpO/VvNYE0yJZNIJW+NQdyXhHU5bpW8SJA65PQshQ8CrPlUoyUI
         UehA==
X-Gm-Message-State: AFq9FYKPOBQ2m/aEG+/0tsFtChi19bKD9KCPodhJZfkK8NGNVWgX6i3B
	sayTLxRcXEzHzd3vwYwgK+jP/16CoeUshDyemxQMAywq2vrl3Rby66N2+3wKLr5ivLTdHj1K3Lf
	EOTtuxeRljiqrPcRyj1pneeKscT/ekln9zg==
X-Gm-Gg: AYBFou0Qe/XRUCCyfhB2kL6YNZG/3nTZKPCTLLRKYYQPw+eaJpTk/Oqybu3U64H5MP4
	ueyVQqmJKPPKL6a4LgAiZQo6Z9I4Ze2bBV0zsPfDK81Kqqf7zLil2LeSGkjWHLVHz4bRmo/CAt+
	/EfnDWmVtWNXJlDUJSu1wGeeMXOWu4pcoL1Nme7xVNduAn6pPZZP3MXTubAHANF+2TyNNHVYs/A
	KcCXg+E0zCjZkBgOvk1nHVrMh/K7Me1MXGXVsaMB/TfbdCki4uTZB5ysy7p55BilOp0nOw1NBpz
	NpoQK64aFff4GtJg8lqbsmuNK3zqcq8CpNT2eY7b5vtRKq8Rwmy+Q0+8Rv38Dw+eEjlRzp9o2IL
	/YLTlNhNQNgQ=
X-Received: by 2002:a05:690e:12c1:b0:67a:ba9:4246 with SMTP id
 956f58d0204a3-67a0ba946eemr9279d50.37.1792507074958; Tue, 20 Oct 2026
 07:37:54 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003728.13669-1-vfazio@gmail.com> <CAMRc=McxpU=hAivRV=e_QEVsChsg6SCOqwCsD__qUBogSfv6EQ@mail.gmail.com>
 <CAOrEah57VOsF9aSV3zRF787EbfnkBhFkyxuGgkWjgbojMyhp9Q@mail.gmail.com> <CAMRc=MdhUJQOZqwGw4o8k3y0eTU4AOEe+C-sLesFR-PoNoSH4w@mail.gmail.com>
In-Reply-To: <CAMRc=MdhUJQOZqwGw4o8k3y0eTU4AOEe+C-sLesFR-PoNoSH4w@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 20 Oct 2026 09:37:43 -0500
X-Gm-Features: AclHuK-Odv_E7osaD1nRJQwA9lN2aQ0mtoPvt2nELDlOAOPlQuaH5N0hozp6IQg
Message-ID: <CAOrEah4QgYXz5adsUVWVJT6ibQGoCzTORUvMSYs4PNyca8GG9g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 00/14] bindings: python: cleanup and support
 Python 3.15
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 8:32=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
>
> Yes, in general Fixes: indicates a commit fixes a bug and should be backp=
orted
> to stable branches if the commit it "fixes" was already released. Should =
I
> remove the commit from the python-2.5.x branch then?

Yes it probably makes sense to revert as the previous code was
functionally equivalent, just less optimized.

Sorry for the confusion.

-Vincent
