Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB1748122F
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 07:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961711; cv=none; b=Vqkx/GK8/I+9CBxIhSM/KJFc/Ong81Bi0eZCi5dKmMwvA7vYorrJdhW5FKN762eR7pR7XOAPaPFm6kKuZmokPeuVpbM2IrNjCBznof3tXebXr6YHK3DhID3F78wCkE3plzRn5CUInA9hllGbHX9sol6P80GgHxNQhuTBGWwSwPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961711; c=relaxed/simple;
	bh=HSJ0O3sqLFgddt4UaonSmDP16/tngoopJFjM+1I6ujA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=No331i20gmTq7sibXgunTTg4pfQ4wkkvNsF69DHLLvw3mHY408qXEUrmXuISqt6UK0ys1aC37L051502LwOe6jBqdfwY3xBy2qzJvoegOa3g34eTT2h/W/Po5qiYoE/3vACmHKV/1V14iVoOY1OZWAfsTqxXFlLRr+jjfo0XjFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4bOK/OS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4bOK/OS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso3791272f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 00:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791961707; x=1792566507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSJ0O3sqLFgddt4UaonSmDP16/tngoopJFjM+1I6ujA=;
        b=G4bOK/OSLr0KJtKLENZjp06nJ4qiTIQHeuzCOvyyiBdQi1AcI1eHSfZo9vsO2kHCaP
         /k57bvnk6DZ0jx03Y9+5EqiAp/yW7OS58yjn4YwzStH/PTyOsZPQHegegIRaaBWx+TtS
         /lKmFZm8vmNZ4VsBfj+Cytfso00gNu8OgGpYmyMOjltgCOoBh9hh3azUqXZSeUE0OEzW
         Z4N/8BZ1Rz3e9XSObebdRVZQzSo8UxLqzMbHqnZ0vNiMv+N31lfV5B348bVpqz3I8I8R
         +Phch6NWC1uj3yfrUq8FpbP+IE0Oz1G0qZvawLsiKghtUq+8SNe8vuPVzZUMUm1nqSJO
         bejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961707; x=1792566507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HSJ0O3sqLFgddt4UaonSmDP16/tngoopJFjM+1I6ujA=;
        b=iDObCNOh7Sj8cENZw6/uYsjzRxuXLRHVRPoXD7iSN3zdRirBjU5hsrS8jqNRDObCSt
         4O8YegDIXM8w3k8Ja7gubQDcoxpCz0e6Aq/1XxM7tre1/uURVhLZ/J1zJZ4nk9eNyUGx
         evxzzL3VJOWRa4d+eiWx6XaBuwvUNz6Dt7cKotmqQjl9ODBQoDgP2JbinMjkqwxW7t0w
         JCtnq8xmWwHDP9qBb4BdiD4gB+s4FZHnWzPRRbzs3vAeutaFRqX7lkaUagz/m/vlHrti
         iRolhmdncBSxift5iMOfCvqgFCR4Ef3sV+WfE40hFTQa7rcOtVBSMBPIpO/WR/PkjRF3
         FOqQ==
X-Forwarded-Encrypted: i=1; AKwUvBybhquITBXEvDsBjGAfljLMa26E+2QymQFN3bYE/Y0JrBwIvIbNpnNyd4vY+gZgUB7ttRZ11naVoes8@vger.kernel.org
X-Gm-Message-State: AFq9FYL+dQ4xOETqrCkzc8oeZ27IXe1joqPJmpDN58la7Ip0ujzVTNcS
	aG8pzBTJBfHhIy1JZi/WKrRwVEVpL9eXaFCZDIMG5e1jOpVn8e9PcYYy
X-Gm-Gg: AYBFou0aCiVvmm1xin358Ivpu412EKHGYVf4LZ4TSUpFnZvuq9VukUi7HSN6ociDG3Q
	4e8XltqKM7fg8FTSWtz5mdxBAhMCPHjmYlrN7dTU0cw7/GpexVjEwJRY4RvefjgfA3rzRus37tS
	e4NloHKl22gMSo6NRfg1E906fho//HNvD+Qg3NYbjBIKa+HeI41dHZx0MCxc5bgTxYpxjUTerVc
	kuvsglQDMGXcweBIkdOpL6q5QlpYEqtS1hxCkOIF+rn5Xmcy+V9p55+VBKbAme1hHNBXjW9T9BY
	KWs7EqyAKAjmdZTHWQcL6W5nNXimTcG+jWbwCpcrWLYtgJs4Af/hp8fO3L8GuegbxIGjv8StO9m
	QAJM+2hI+PX2Oz0QaMkgdDC2dYBWB3XL8gFYjSUUAp0Z92UB1BnlP5RvuaF6NFONN3dVqk7arrW
	/9sUXxlJL05eDBVEFmziLizdrxDwGB5Z4S9o2yKTrddh3eJ6CnoIZ1UzVHdEHAFWN4RNK3uKClc
	ZjFN6/a27OMwaLiClBYTvbeJRIZKqXzF4U0gat4FSb8rWdh7C09ndy/RaZvliTMoTUhwd8kJrbT
	T1TXlb7RmdixXKcDCO1y0WDNVWtt0fxldFmu/poYQvjMJ1WIis8xhJVnSdzVpA==
X-Received: by 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr284640295e9.2.1791961706847;
        Wed, 14 Oct 2026 00:08:26 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b748cbfdsm15512585e9.0.2026.10.14.00.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:08:26 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Wed, 14 Oct 2026 08:08:24 +0100
Message-ID: <20261014070824.1719493-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <asy9K6Gqygrl492D@monoceros>
References: <20261010130024.177503-10-ghahramani.navid@gmail.com> <asy9K6Gqygrl492D@monoceros>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Uwe,

Thank you for the review and for pointing this out.

I have dropped <linux/mod_devicetable.h> from the GPIO driver in favor of
<linux/platform_device.h>. I also audited the other platform drivers in
this series to ensure none of them unnecessarily include it.

This change is folded into v2.

Best regards,
Navid
