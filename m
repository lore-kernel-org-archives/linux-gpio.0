Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802F39A078
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345018; cv=pass; b=tbgcdnRZ/1SXtTLeQgRZGg0e63IO0lv5gEfv0s5Ogmi17+3cy0vFK6cAhni1DJkIYo0eHn+juQDQre0LEEl0yJDGNtuV4R8rkNAsvbVh+4iiKK1zu5VT6AnH3oGGD4ifQjoXvoN4xOT+AAty1GXaE2NBw2cZW4mhgWCsfkkMtQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345018; c=relaxed/simple;
	bh=BMS947NNKFPLRfvtLju1EWeI0B+oJCvSrJJrI8dbBl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8a8EJTsgXrJu+MrfblmzoM16cXbvmmZIotFBHGMR765dLjK1j24LvhxWf4LMrWmZIfJEDjhJg4578jCv6pYjaxBAWcTFcYFSB/1Hj5IaRMWH+8HmX2GM+i7w0knjDpmiMmAfp25FiArpL9RmYp8nZu1zdp1fpWFslOBc83DAWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pctXNoLd; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pctXNoLd"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b3119957f0so967182e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 23:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345015; cv=none;
        d=google.com; s=arc-20260327;
        b=Dnrpdr8or/KRWqdsc+Us+uZPfnWVe/UmfGGC+zQv63nmgthbrT6HJLNqhQNLEIrEja
         GDXFqrV5/n+Hy62Zvsm8gXzYATwRERktdHpKAw9at22gWc1FXvCKZNvPvtwz8J7R1cA6
         NEhHqWlnE6mfTaoCqBijI7GFOZO20pLuntgUdwP1c+heo43b5B8X6+pbp7XDh7oo6kEJ
         K2XvJyobCfUGYGXYtICt5Nnr9HpsFdfaTaGMahe618s/Xwq1Z3mjDhe4x+jo40hr7MeH
         YBcMi/mv7CbtvB9jyU3YK0uV6CgMQSaSwSv5cVkBeeaJW24PCEHBHbxeW5JqLfJFr9rA
         Ds3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BMS947NNKFPLRfvtLju1EWeI0B+oJCvSrJJrI8dbBl0=;
        fh=TiZ+dkkWrB+M52TJ4bGzspXzU4Gh96zx/oQAPkeAGSY=;
        b=Ms8EZlbW1G4ORcMnneBxs5InlZBYpnTMBKJt1Qwykg2rEf1zz0IiMlu+HH/FYIn/nd
         jzRP4ATAimW5HF6Twibl9jV2csvAK9Ai3/GKDt7mLnU3rQeSuk4162Jh83+27IO5pDKO
         OLh2WBF7PZ1HxaEnOnMR2pC7UK50U78zVwVOfnhChtp74y24PO3FtjxfCa+X8dpzQ1uC
         4X/vf0yss3rcet0Masm1wbCkt0sRN0qpzW7DNRJ294HOjZAYsaE9S5p+kFQ4ikmego7z
         QbfEaFUv41oh8C0vjzz/gzis+ahrs/Ne+gopE6XmozQ8iULaPaOtUjExRdY6eMx53R0o
         82vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345015; x=1786949815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMS947NNKFPLRfvtLju1EWeI0B+oJCvSrJJrI8dbBl0=;
        b=pctXNoLdGMzIBwiluna1jtIgW3v1zw77+ufUpRPQpns47Uk9imTInhSa1Vk7hSN7tg
         QuGPPPbBExVJyAqtlcH9dcRieA52DXouYIz/qZBwKc05LrC3sIprKzXrFmzxygUAixOB
         KQxg7k1AX9f8pRfclFWWaCB9JYdGAoVDaojbrnzQ3r5iZd1EGP9H9Axix9GBvpAtAQwL
         sFbdIYloopsJAIKHT0Yh0ldhuU9ZcwkZ4zrGSMuGb14pwjmxe3Cs0/ESY+JOE1J3m9wR
         7XSdbJmXghdnjYogKC651gHE6ECcZU1e04Zyr1t4M5X0du+eJ4K0GXoYz7wxn1Fffmcb
         GQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345015; x=1786949815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMS947NNKFPLRfvtLju1EWeI0B+oJCvSrJJrI8dbBl0=;
        b=VUhHpkflyPkXidZOp8FH8dX7cXK+PH5Ola0L4NM7ATgOm7JYkUFa778524Mv7vNACS
         nl0N5D8fEXkBVrAo4+JliHiHTdVO1eBVkwztZ22ovfr+gM/6Svdxpur0udor5Q2CYg8L
         3MgJ4tWen32RvQ75XnFgOkKFVNtilWZAZXo9j/oDUsrrQiQZswRpiShGdEIB5fQXdsWb
         mBTJt66OxQTQ/ulIXCdzMrZfiUGefrvpx+fo1y+S9DUmXYkfWY6O0XPTkPjr4gDkw1wu
         YnGqcgfx+s5a5OT4N8LYThH1q9b40rH+s9xAMc2Slt+Egen/bi7YX8KcRMizmYUxGd+u
         u9cQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfDSSvBadPJyfwaXozIxodjElCewSbEPlHZSxGzPOCrjIs+XIAoieS5PlBdYmQKFa4XcQri6OTX+fs@vger.kernel.org
X-Gm-Message-State: AOJu0YwCArTb4gvubXbpcE6QpeQjzow1COEamUCvs+ZjhIIfDUT9wizp
	AzSlIBnKlP1wBEG2IyQ2NAYdTVZymwpu6qOccFXtq3V8g3SGHT3dZQGwVW5OWNmbmUZ5nRroFIS
	RdHMVoV9pQmYkYx0nFMb+wc96YHImvmw=
X-Gm-Gg: AR+sD131TjDJROLVWI60fxG7EfkFTTWFQiU8E8KYpjA0NYbPmI3aiVV/t5pMAQBx5q/
	5EN3v1M2tBZDlPSpII+oHpNk0MQBc3QXIZYylG8BpztJG9U5N3SUdG1xUg6/f6NBUYue/wSB8xP
	yd/VV5Y1tJ+YsU/a0k5pY7hekP2qtEeGGdzGHGwwDOepgTF4weS/cUiz9/ZXNx2JKm+/0ym9UYY
	/hBhehWfYnH02b7B2iMd6ZO6zcEagg+G8NGQF/u6FcJe82tRa/Dn1wzOY+M1Py4gRzygkrzMJJf
	Vr7rh2ban2eymo8QflqD39tRXWAqvwDim9/L1tNSbVIck+frpO3W4zsa76LK2I5piR/fqpa+bix
	2cjvVa7IO33hQ6ofOPpKQJahr45hhUAfT3vatQULaMdVisxjysa7xuq6fliWGzpoMPJ9Gs12BQS
	vLbyzif9muBIGRZQuWWROMZEwAeW5r/RdCcQoIMWOGtw==
X-Received: by 2002:a2e:a54e:0:b0:39a:fd6e:cac6 with SMTP id
 38308e7fff4ca-39fbb31824emr47436021fa.25.1786345015069; Sun, 09 Aug 2026
 23:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-4-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-4-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 09:56:18 +0300
X-Gm-Features: AUfX_mxLdCvPxJ92gnHLx_UxcvhKNs2Up4fndHZdjA36eDXzEudJco6-A7yijvQ
Message-ID: <CAHp75Vf2XCh9RZ6cT_ZAdZpT4mXmrYu+8CNwzpm_Ra4TrSZhsg@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: baytrail: Propagate errors from optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:32=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

On this platform (ACPI-based) there are no other possibilities to get
something meaningful that can be returned (deferred probe). The rest
of the error codes will actually regress since the user won't have a
pin control driver at all, instead of having it IRQ-less (which is
doubtfully useful, though). Have you considered that scenario?

--=20
With Best Regards,
Andy Shevchenko
