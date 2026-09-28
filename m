Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777BD440655
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580163; cv=pass; b=uuV8km4yYXJNDeIjkazyxkosagtjj6iG9YRmNYQQnHmQIja2b6txZuic9BnMkHpJJNB6D7349vb6T3kB2ijPSIXeKNzhgdXfi3Uvj9/UtnlA9fasmQcdXil/YhSrUHBIIX/QsCrVLXuBGLZqVeCPknqtLpjn5ZJJ71KzKHl9QI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580163; c=relaxed/simple;
	bh=APrQLHWyNaMSnUAIds3Epz7+tbhmT/nxmeVzEs8HE4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TW/zNnMvDjE5qe/KsRHCpzFRKNt5XvvTP1QRjeKCOLDqoo0blGogWj5f/2u4aspy95ThnmSYsPAl+ievp0y7Bs6vqqN2vx6hdUpqbRpFoYos+/vXuxpcDmVqypCrAvesV/HoGSYE4faRMgHTqxCSNqHGewnPessYzeNacjNOUYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aowtTon9; arc=pass smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aowtTon9"
Received: by mail-vs2-f39.google.com with SMTP id ada2fe7eead31-7b24ea1105cso572936137.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 00:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790580154; cv=none;
        d=google.com; s=arc-20260327;
        b=RTT+3r6J9mEBba2RB8Nzyj++hLjBGOxkxAY8Ikb9tf0QCS9JpL4MiLdLp8zCQMH/Fz
         96sgheYC+iNk2SKkVN0SNOKyjAbN6s0NWDmccaWJL4g/wBsfjFoi3a6xvwYFzbc2SBML
         YZ7vlUfgrKzU+93bf+IDGqB/hUm5pjUJyTtxwpndaEagUE3HUq54GHBB7hEH2j9PpUB+
         z1rV1CJMP/H9kZom+nN3t3IQ55Jee7d9FrI6xHdDai4zr4DD8ieOu/K1+6sYonXp7Jmj
         t/vu9Mmt7Glu2wfX/HH3yJWlX0ulWXHNZbCpznpWdu4Z8dB7YYkOTMFT3FRcBVtfLj14
         m+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7S7hcaIQrNT100EqV+kMOddYduCRqLzOTn6PrUxYv68=;
        fh=db96QzNIIjRLmoNy+8Wjy5/W8lqmHvwpe9PXFReHDnE=;
        b=WnpWTtaCEwr8xjuqOcMcEkFDftPdzgJTMd9K11yMQUYt/s/nFSsyGQ8o6GAXwg+MXD
         k6lGBanUF5AonxOwGabaKH8zqIANy3oLj/+WxZjRW7wLSPtCWono6sFV/LD3mk+035Uh
         Vfwr3mFz/zMTJNx/2wQPiWfgoQ5TUzwSPuxm203agxWcmF1fhRKI48/mZLw0rEfztoQU
         qi4djlBtAfj00aZwyGaT/qgJeoVbPduvmlr/hu4nBqPUwKQWIszT50IvTHIoydE+bPvz
         eKAG3zi599LoK/uMVM4ywaha03+wteEmTEk347l3Cr7PxEt6WGs/0vecEZd2/Mrpmoad
         HgXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790580154; x=1791184954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7S7hcaIQrNT100EqV+kMOddYduCRqLzOTn6PrUxYv68=;
        b=aowtTon9eurVABMkco2PDehcr/Udzr/nr4OhZ9Sv/tqOxSXHrkp/TGRYtOzBXeef2x
         L+p1lw7+1d8T3kosxzJ/covXUFOf/UtBEXDEqGR/aCkFEWhB+lv7mrW6pa2ZseW41W1r
         tsHx9oHjkZhhTdBc0VMhShTEq2qSwDj5Lcj4i8c00QTjzK0wgVOTTohMHYPqrU8FzyXJ
         aZmEy6/G8SUrF6vDt4uNBDVOk5SRorvptVTwyQBzENqsPXBa4HSVAGO7zbQ6bcjnVH2Q
         nA5nf5cZBX79bXvFgnPRzND/i8KGd2jDp7czqNhfeQEjy6W+KKdZXUtuivc2y0e6xp3D
         /hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790580154; x=1791184954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7S7hcaIQrNT100EqV+kMOddYduCRqLzOTn6PrUxYv68=;
        b=Goe68HyxhQkloIgJ9+8Wx04PdROXHkYHsLBeUEuRTu7NOc4YnWEz1ozyoNxfQDHTb4
         uHCLAtde864LsezPXbF6mBL07zchTB7a2v0gYMEegsNUfnULqEaGq0Kh3MGm8TTcJzZk
         s6n9pCudYL8Uv2dNk5XhXQaWg1u1sPGetrr51hVn6kZbzhjkGgl59uSskqlZfxmdPcrA
         tSn0V1AWm1rtAGZ+iizbI13xQ07zWDSPXe7LX7RlARXX4+KAICVMZIxTFXO3XfZ5d+aH
         c8m1uw1UTWKBxvTlAQ2mK1fxfsVsE0homNgMPFI1oEYtDrmOLW4G0e5T6h1ORg3m2hmw
         kXbw==
X-Forwarded-Encrypted: i=1; AKwUvBx0z8OMm1b3GXQJ6b2/IolSf9eETqQljJmmRMXAp1i7PJkOizlbq0vRXbf0J/Up/slrXQ9RjMtxR5Y7@vger.kernel.org
X-Gm-Message-State: AFq9FYJmHRYshcWA5eDKty6H2cC5vUY0O9vyfoUvkc03955XfJpyJrwm
	Frm8BcKlOIuz66vxP1on8oCs9JKi8JMYF3jhlMF45EiSqbcT53tJMwTIQwpwTyK0z9R+7NjsmaR
	R2USHalMQgQrYqD6R1sWVuVF7r7Sm1aNV7xSrqlc=
X-Gm-Gg: AYBFou3PPQ93ZlQpkxbgJTPxNrKlV42I8zuPO1MhlbWo7pvq8yrHt5GhYN4KiBGFxi8
	ZVKAxeFvbNY3hnIPx+xLt/8fyjQJsZUya4Nqogan2wvRZC/H96noGNWtq2JaJz6kkUgAGjQjOPm
	nkP6Sq6LXKXjkOPl1r3kheJ6ypscXIIBTEqIOukITx3pbdNoL9aTviMjNYzhpnwVz2DWLjWs1/e
	t9OlOi+qxk/U+z5sTiDWyIqdawDJe3hGpvI0BXdE/fmgrymtB8mpis2pdAkerc8g3NNJfhAHv4b
	Dz7FYgtMaxjMx5dqwDssUfdewuxg8NMGqTk2d44S5z31sI0Xp3AWVDV14K4lZVmUit/TOLsGL3r
	TiY5T3YGLkYUIZ8SpEdgNZfOvdbgQMoI=
X-Received: by 2002:a05:6102:3912:b0:7a5:9a:3a31 with SMTP id
 ada2fe7eead31-7af1e0ef5f1mr4324150137.34.1790580153025; Mon, 28 Sep 2026
 00:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com>
In-Reply-To: <20260928063824.1386524-1-morbo@google.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Sep 2026 00:22:17 -0700
X-Gm-Features: AclHuK-aDUfgxYTMcH2KBUEabNgFX4lq35X-cZ81U2Qsle4b2SorScwmDO1r1OY
Message-ID: <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 11:38=E2=80=AFPM Bill Wendling <morbo@google.com> w=
rote:
>
> The 'data' pointer field in 'struct acpi_gpio_mapping' is associated
> with the 'size' field, which represents the number of elements of
> type 'struct acpi_gpio_params' allocated for 'data'.
>
> To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
> attribute.
>
> Analysis of allocation, assignment, and access points shows that the
> pointer is never accessed before the count is set, which guarantees that
> this annotation is safe and will not cause runtime panics or
> false-positive bounds checks.
>
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  include/linux/gpio/consumer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.=
h
> index fceeefd5f893..2b80cf7aa7e7 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -667,7 +667,7 @@ struct acpi_gpio_params {
>
>  struct acpi_gpio_mapping {
>         const char *name;
> -       const struct acpi_gpio_params *data;
> +       const struct acpi_gpio_params *data __counted_by_ptr(size);
>         unsigned int size;
>
>  /* Ignore IoRestriction field */

There's a problem with 'drivers/firmware/efi/libstub/Makefile'. Clang
needs a compiler flag to support the "__counted_by_ptr" attribute
referencing a field *after* the pointer, like in this patch. However,
the Makefile blasts the flag away for x86 platforms. Below is a hack
that copies the part of the top-level Makefile that adds the flag. I
don't think that's a good solution. The comment in the driver's
Makefile says that the stub code executes before the kernel does,
which I assume is why a lot of the flags are blown away... In any
event, I'm not sure how best to address this.

-bw

diff --git a/drivers/firmware/efi/libstub/Makefile
b/drivers/firmware/efi/libstub/Makefile
index 77a2b2d74f3f..945674048d8f 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -19,6 +19,14 @@ cflags-$(CONFIG_X86)         +=3D -m$(BITS)
-D__KERNEL__ $(CC_FLAGS_DIALECT) \
                                   -fno-asynchronous-unwind-tables \
                                   $(CLANG_FLAGS)

+ifeq ($(CONFIG_X86_32)$(CONFIG_X86_64),y)
+ifdef CONFIG_CC_IS_CLANG
+ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+cflags-y                       +=3D -fexperimental-late-parse-attributes
+endif
+endif
+endif
+
 # arm64 uses the full KBUILD_CFLAGS so it's necessary to explicitly
 # disable the stackleak plugin
 cflags-$(CONFIG_ARM64)         +=3D -fpie $(DISABLE_KSTACK_ERASE) \
