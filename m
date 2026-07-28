Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1584934F46F
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 06:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218686; cv=pass; b=o4f/agljH1DuB6fjWkvT6DLBwrbMFpSV9BU1/JE+ayf59iGVsfV/+Yofly8v3nW2g8CBCAqvFJj6s1/Y5tBziCC3OSp9SlOVaUVTudHpu7U9NiQscuYTyJ0tM45nzbfyFMhPz9EFPoziAGIKqkPuK9NiZb6m1vrPzdNTxpG/ji4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218686; c=relaxed/simple;
	bh=s5epezU8+nVa2HZkHk30QpaTBqzBX10432LDzMEeYLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdVtuc5yVh9L9Cx/ixNIpgOz/MCA2Skg2A0TwaAMGk7s/kNJ7T0izRN0XBuGuORyYRxYDGDr5CUG02+7FucdwSC7gG1trbF3xquui3tsirFvHsaSA6fNyixUl+cUZlLun8dPwKdFYgpQfqfhuekJbmNCgueTVENkXPtdsXZije4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTN5kML8; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTN5kML8"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6689f36ae56so4776830d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 23:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785218684; cv=none;
        d=google.com; s=arc-20260327;
        b=c3W5TKcS+19d1xIDaK6DlvxVczlDofV8bwxHhSl91MOUt7t8Wxmox82ywpuYnVWGT9
         cg2xcXk+BBhJDJ2b6Ovsg7Q0LNZmoFlQlf9dkxs1ON+6IJavTPlJdeKbYa0AIbcv2q+B
         yc2as5QIFh31h0IoELonlDwGxM972y8BceqNCMCzziVrYPnZzmfVrTUHOxo0hJEkWbIR
         I2HthiiOXXcNOr2qdJZy5ZTtQlwpyKHeDs1b0wl2lSrqXavg/R69NuerdtRQ72u4Vra4
         kxh3mS4VYkvf6vlJrX1h3jfa93HeTqc1lzOzTQh/RyJYrAdPCpob2mYQSoXZqB4agzjv
         Xjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tPvQKt2i7eXrMO5OaISPk9CgOionShn/uZChS4URYxE=;
        fh=ODzCtfOjEqUCHTnsqAt8yi2ivPVKFEIMb1yiCHi8QrE=;
        b=sIwJyiA+cAMQ7bsyg6lmXmNwAYbj+f2TCYqiD05TuB4xA0ohan93Oiw2EHXppRWcg9
         O7PQbBLbSclzOEQDQ/BYuDNTvkC0ESSVzz4ILocM26Ig646VY4YWj6/KRkhvP7m+/aW/
         HcCawn7Nhf5eN64y38XBZzxs5SwFMnmxDpSchhFUurid8ti0AmJ5sSWTtdmD7bCOrgpP
         4OC53AgcfQlYPyTs9u8wPZWuJMizx5eadsMvuLmeh7T6ivo3P14Qki+D8a5+nejivz0l
         oTVT3BTQZmNHNezOd2Af2hmNr7IM3H0TI8f8vfAExdz1EiV0vh7/jZzHY+Gt5igiZeot
         7Lag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785218684; x=1785823484; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPvQKt2i7eXrMO5OaISPk9CgOionShn/uZChS4URYxE=;
        b=mTN5kML8YbdwB3EWpzCgvt4Ozq4BGU5O89TZ+1ZJ/7y39BLVD41tbg4nPCnbrALgpT
         LKnMokyEzRsq/9y1YAbM9uIs88wNHuNy1dutqx7gR/yaGAfoY61N3yZ55S1gDVp/HkWM
         2ioYt7nJ1GVYLHy8PZbuMN57EfO722S/rhsgJufuODWbtXpxu+ZTbsvYPU4mxcuZg1G5
         QMyEkkVI6M9SOAUUGdtL945G3B+afqapib7UepZ5LztryvTXNuiKBY0M4XuDIKQBfJ4H
         jxChNQ7JGXsOMzEBomdPBZxuwvwyvy7WbORhp+kHlMPdqMjZNhOmTw83scb7Ty3lB7+/
         CkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785218684; x=1785823484;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tPvQKt2i7eXrMO5OaISPk9CgOionShn/uZChS4URYxE=;
        b=qxlBug8wgGrsoYX2JEWignNUTrQuxV/8CJ5dDcBJtQ7aFVMfWN+BWUVHdWHX49cnXD
         Oc6EVMVfzXJN6Z7EwoHI3CbcZvXhUG54n7dBp9pF6hmx+QbtPR+cJb4ToW+0OmCtWyIg
         vlCEgQOkTQgw/6/O5/1zZqPMwiYL7ruXco0x8Qi+A1fk7ay3bYmwSYiEWmIe913XnDe5
         WPfLTpflDtXOh2MeTV2iF8Zac96q8r5b+ZVYSEOrGA5856hIldzRbgc/Soo0xzPiM5C9
         kin3xSLACt49H4UnTHA2eHYaust4FeZ0cdbLBsjyOh5uBHnYsnAReOv8LPQ9Hr8Ye6Wz
         IDsg==
X-Forwarded-Encrypted: i=1; AHgh+Rrl6/4Krq9TfhaPO3qhdhslJn0ve42khXS9nK0+SgD+ZGUdABN8MfybFYTasy9ceaeOK8rQsle75QQR@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtPQx8iwLmoe44RLEregUKu3IHBnFWClN7gIldrJIT2e2OIqh
	hKvv4SYvIMIb5BSqhZeIRFHFRaNCBIDw4SHzx1O0SRKxeV+dX/gUjFxObcWtSzDTGMYbWidCDxI
	vpjM1g8+GdBvrbDbBSXvJuB/aX55WUxA=
X-Gm-Gg: AR+sD13GlwYOUiNZxDgwYL4SmOtxgAL2PIL5cSqN2yw4eJQLh1VNX3lqL0uSTycYX+9
	MMytbSkHdwhI3wObWvjnX/8VMZPH7zjUij4/rYbahqO70SlwMTpXjsE7Y8CjOqmZZDqoCoSEqC5
	KdYtKJtMLdTj989kcW1A717tQV0ge1kYKAJGt5fzTSU/2FxXMVblUz66bQrdMvmm3QPCeErGXtN
	l5w89Zpdx8PqXJZe6zCYQQg70DWfH7g80q1BSu5+jEAcDymRxMZ2Oad5xfJ+P2QyKI+EsoKvz4D
	gOodGS9eYJnMcAPPclj4m+t64CS3NKNGbtyNXu+6xN2isiEnYUuM/jHSUyX+OgqquQzYIiIsxDn
	tFqIE6bEyWDe7AtaAgwDGQiyza7yLiYZObtxV
X-Received: by 2002:a05:690c:64c1:b0:81c:b865:2221 with SMTP id
 00721157ae682-81f993761c8mr4831037b3.33.1785218683887; Mon, 27 Jul 2026
 23:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718054330.8975-2-hardikprakash.official@gmail.com> <CAMRc=MdXGeCiaR4DnXT-jor0uh1EUJhXhmPrmkbMbQ-L35fGig@mail.gmail.com>
In-Reply-To: <CAMRc=MdXGeCiaR4DnXT-jor0uh1EUJhXhmPrmkbMbQ-L35fGig@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Tue, 28 Jul 2026 11:34:32 +0530
X-Gm-Features: AUfX_mx1D7zYt_neMZjzc8posXDfBhO_CdkITOYNmSrJiz_7-6bJROpHlDSLoN4
Message-ID: <CANTFpSXmRqoYNCFkL62tRLLcMum72DGjCq5k5wYBgcKvUgqUhg@mail.gmail.com>
Subject: Re: [PATCH v13] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: wsa@kernel.org, andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, brgl@bgdev.pl, 
	basavaraj.natikar@amd.com, linusw@kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram, Andi,

This has Reviewed-by from Andy and Acked-by from Bart. Could this be
queued for the next merge window?

Thanks,
Hardik

On Mon, 20 Jul 2026 at 13:37, Bartosz Golaszewski <brgl@kernel.org> wrote:
>
> On Sat, 18 Jul 2026 07:43:31 +0200, Hardik Prakash
> <hardikprakash.official@gmail.com> said:
> > I2C controllers may have child devices with GpioInt resources that
> > depend on GPIO controllers being fully initialized. If the I2C
> > controller probes and enumerates children before the referenced GPIO
> > controller has completed probe, GPIO interrupts may not be properly
> > configured, leading to device failures.
> >
> > On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> > AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> > pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> > AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> > fail with lost arbitration errors:
> >
> >   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >   2.348157  lost arbitration
> >
> > Add a dependency check that walks ACPI child devices and defers probe
> > until any referenced GPIO controller is bound.
> >
> > Fixes: 3812a9e84265 ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11")
> > Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> > Assisted-by: Claude:claude-sonnet-5
> > Assisted-by: DeepSeek:deepseek-v4-pro
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
> > ---
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
