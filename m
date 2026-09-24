Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D3E49F133
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 15:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262050; cv=pass; b=LVl7M403eLi+Vy2fsxRhNs6iNa+Hq8gbOxyYb03WKqxQpQe38uGR47x1Goyx2tucFyqRQGz5oLa5sEXu2OdxF6vlDPj/KTWohW8kDlhgh2G97PdSvNMmuquLodFfMB1IOqPYT2Gurib2ivt7wB7/sl2qCClXs8nkavW0j8uIec4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262050; c=relaxed/simple;
	bh=iuUfA02SH2tSSicml2K0I3xqm9pZO7ThoY25b+dKE6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j35a+m0b3AB0uStMRKF8Qf60FbAAwz+f8AIrBEiZbHNgEFwj/xTtfWNd8iTJ9p1fJmu0MFOtPatmulwlTHl4SxCXHH4Qt3cquR8Hs+ZMdocKieep3Y0ujDJwxJHmxusk1xyCxr/gYUNwLzQ+BOLo/Q6INQIh3bYNf/CQaOCur6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=be+IEzLQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MB+TPoTO; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="be+IEzLQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MB+TPoTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790262045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
	b=be+IEzLQ51FRhM/jDzhbnZgNaO4HSDTSW4iEKJztr6JYlLw1tALtCU1+iB2fr3mcqUZnpG
	1hE3vpMJeoyoruRGKhnDV5yOPkyNNal3PF9TfMw6N5LFBLW8sR+x2KSJQJzUiwv1lYHZ7x
	u+A2Xpa2bkgMKVmAvfo6B1UPVaorLDE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-X8N2P48LN3uc9qtXfIlVXg-1; Thu, 24 Sep 2026 11:00:43 -0400
X-MC-Unique: X8N2P48LN3uc9qtXfIlVXg-1
X-Mimecast-MFC-AGG-ID: X8N2P48LN3uc9qtXfIlVXg_1790262041
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-87014338e7aso20651197b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 08:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262041; cv=none;
        d=google.com; s=arc-20260327;
        b=JYoPGHq1u70oSrYgtDkorLp2I03zikXG4V735Ryo0CWNcJxVMbRc1ofEUCWsvqgxcA
         5lfUwbIwOnYAvDlLzpacEolJlAbB4ORNpC0b426FN3WseXSDfqdnPYQ4+MUnWu1N5KHf
         QVSQdOBLVXc88d4j6KBKydxmEM0qTiSxmHTiUYqQxiCVDmSTXIg5Aq6iqYqqcsL3x6mg
         HadsRpOm35c63uqrV4EyL7fLyWzNN2GNigUkovnPjsewWSIWFRVRbkOD+WGcNniM0HcU
         6gqz8TyXPNlgcwCiIloNziR0aIPpE21bNcOlxUdf1ijchwqGOSEy+J7YZLm7J+TQYqh6
         mvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        fh=0Dr/570tIfg0QaxG4aJLQAJbze4pfG5kYNX7qWZeSnI=;
        b=FsT4MHOfy5V7a9O4v0yEhay56fLJinWqOsIzvows1B+1QIokNb7C5AWtQTsFihSuzC
         r0+W5rHCeUSAwoRR/BsTJqmv1AqlHW6RKK7nyOKNzmpdxJZL7StGbXxGLvixWuE6lTH3
         1LGIRTC9wJ8v3kkk4O8r9a3QV97RypTy+/DEXFg6QvaMLG1lB9sbdNShb1mUiKZNjpUw
         /tjs+2Z/x8DSzVqZWx/RUMXqBz6n4khgNSoz1HTcfV/w43YNAO5ncZM3A6254iFWsXSw
         SUpXhbeo2ppZKJ/z3q30WvN6jpdaB+mDiw52oynbD+CYVbpjWO0L4sZv9NR0PetC5/ez
         Ly2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790262041; x=1790866841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=MB+TPoTO0UL/C/JWM/LVsxnasQjY+h1khIG4DeozubMiCYazhVX3ylsrhPBKCX2MOK
         HAc5oIVzbQPSw2HG75JDjNcOHtvhwCeyklXtaGWticCEclMb2VKNzvShsAsHzcFwOZ+P
         /JxVDnVe+Ija1v19hZTZqplTc0ZhYoM0nD14klLfOJ1tnJ7FLa3jQtmTlELTgD1kJo9b
         S93jDpjtFAzn2e0L2DY559wmyCNusbtOehWRMP3qGxsi8uMTeaIcM+peQLF27P3a9K0E
         Xg9Q6hJTRyO/2YRns16gWAGj9XiFVni/AK43tn4dW2GI479uB3NSoGk/HsRVF2WfeIGA
         U1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262041; x=1790866841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=EfkJNDxV9gFX89kauT37W66atjW3arOJ8n/c1aYCt6XWphIiBNQbqNtQNq7WqnU/wE
         QVtqaB4xGL2hnwvOdXL2hFDcNOygFAmwDP5lbcD4ivl7GSVGR/c/yY5QCV7pMaDblj0A
         eAnpS0C1psnYFTx/wHYAfPPtbeA6+CxaS+uiiQ7b1FhNcew1Cpju4vzwL3VmXYFlmXez
         kyOO2mCmBZVGteSibktRdGx2ZaV21oq3d+ig39l9c/56R6XJvyU7czHVh9+m28D14keL
         JJ4hOpFKudEYX3DtLp0FUe2Nax4kY5sxR/300ILjtkvhyHj7MlvRYDx0h0aW73H1I5gM
         JHBA==
X-Forwarded-Encrypted: i=1; AKwUvBw9vn1HZmaRTRMtLl2N9km2DG1ONTTKLfwD9tYxTfkBw2H4JNageWwcf7CbXSTQiQuCfRyQHXxUmdC7@vger.kernel.org
X-Gm-Message-State: AFuF++myAmDTJFlJH0v1fuAZ+siccjIquH9QqFo9oNPIySuhfRe2kZhh
	3mQLLQeozYa0tr1Gpimc+TMkv/N6YPjCImMRaB2Rx8SrKNBBgVa+o+3edCgw1YR8/+BGfFLTBnk
	yNNNyjUfPwFRK99sL4IEeSlis4wcU9mo/dcSHao3QuDGQu3HUPKYL+J+MS/s77LVdd5OTwyDBsz
	kNNVmapPLRuX7FPJV42+t+fszBpnp+LFzRMUa4tQ==
X-Gm-Gg: AYBFou30rUFrr17Wki6kg5A/umfsQ5o/WRba9OuUe3mILc6bPx5GZ5BLC+Wy0LxYIDv
	uBAylwRj5CtOkeXX28BecOD7thSaWdd44hUKtFeKV5KMSf8/s2YugnYLev+POcDxR0MIY/O8/gb
	y/wgsUjx18Xu7LRKhjjFeeQCArNBK/GkvKLYogkUPQUUSj8xgNAAtueA==
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id 00721157ae682-8a64e5d7328mr16131817b3.20.1790262039481;
        Thu, 24 Sep 2026 08:00:39 -0700 (PDT)
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id
 00721157ae682-8a64e5d7328mr16131377b3.20.1790262038827; Thu, 24 Sep 2026
 08:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <EKwbCgCnxbNX4p95qJ3xoytzeNBBLc2L_HOVWr-S-y8n7pNOIToj37TyoXRcLyIK1gjq_IvbreQ331gw6jIK9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-1-3573e2596c51@redhat.com> <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
In-Reply-To: <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:00:27 +0200
X-Gm-Features: AclHuK_S1nrFMWot6v8DC6klfULfaNk07isgmJtfP7BYAekyrR84kzWx2Uw9qhE
Message-ID: <CADSE00JhFYhDV2cuVxZwVTX6LTe8zH0-BR=-Fhv+6UXeFxq_Zw@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: qcom: scm: pass qcom_scm to internal helpers
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Brian Norris <briannorris@chromium.org>, 
	Govind Singh <govinds@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:00=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   int qcom_scm_pas_auth_and_reset(u32 pas_id)
> >   {
> > -     return __qcom_scm_pas_auth_and_reset(__scm->dev, pas_id);
> > +     struct qcom_scm *scm =3D __scm;
> > +
> > +     return __qcom_scm_pas_auth_and_reset(scm->dev, pas_id);
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>
> Why make this change at all though ?
>
> It takes a pointer to the file static _scm
>
> The reset of the patch looks straight-forward to me but this change
> caught my eye.

Yeah, this change isn't useful. I aimed to avoid passing __scm to
function calls but it does nothing in this patch, it'd be better to
change it directly in the next patch that changes the signature.

BR,
Albert

>
> ---
> bod
>

