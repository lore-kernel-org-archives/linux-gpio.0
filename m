Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D9938734A
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334792; cv=none; b=QKeq2910wsKQSwpFGKD4SHxOHzcj688YS8KFfkaQqXwrGjKfXck+MthTV6PCUyL1SWHcvwuXduywSLgH9M0hsIJ+r50Zzhj/+hCkfi6QPjFq1nnTXoXZOI3GDzliiKAMZJW3+5l2amMNEJ69pZRbPy2IrUbYKpngGwq9fXEG/As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334792; c=relaxed/simple;
	bh=yxUZn8+Na/bQwdI6zK/LR8kM8XD7fOqbN4Q0y/yhwUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hR16U578AFdpZ71EQ3hi7tQptU2DEw4mYX901xWaYG54ge1lzL+UpEFdVGVpKCxPCxyfX4m/iAuFwdHuyb9BjQdHG0zofPuWUFf3WYYnqDGfr6IZ8VraTH7CO22QoP79zFXkWYGD9AZ65gXyL1OS3rXtk+eSPJAZ3h84db704qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVqcysqK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVqcysqK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso5560135e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334789; x=1788939589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVYtRrcYxbTiVniZzEVlvJjB3QGXOoZDXbBYRjI7Swg=;
        b=DVqcysqK6QRZyjVcgbson+2ySH4M4Ij/RB8S3zNX6xxB0hYgIsgqe3qBj6CSe5P7Qe
         +7rhdYqFbH6h9YKUlDNL4VD97tJuOmSCi/kSJzS4Vw1A6FMdXAbdHLgjQf9s26PKtMH7
         QotlL5OUn9rVGaapxOF/XUx5rTJi8zwz3h8KJlIwzejW2Vr4VKgj6Gca7dGrpWeqgn2d
         rpH64buDsLIp8Y3/kvScqs24SOjYKazjiAlgpmINnB4JhxiQoW6ohyN88AyK95GPuqIz
         GM96fCe885LEjNbUqND5U5GgcgbwxI2pCO9ToVyWdn4bQiZbL81al4N27/lubTWXLx2+
         gcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334789; x=1788939589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVYtRrcYxbTiVniZzEVlvJjB3QGXOoZDXbBYRjI7Swg=;
        b=Q94RhlBIP4AYg8+uStfnZa5SHODP7MuMKrPyf4Hl6UCklsHQXnLZ73nbmA9GWGCf/A
         navJyXdc1dn1ON4CYd1LoDmVK0teVk3+q/kszbvfV/qXBdGbajjYomdF66rhufIyI/KU
         f/bwkcwmaty17HDyf23DvxedqE5HXrKfaaeifgqy0nQWoj4Ix9Wpcephv88zTa82Gefq
         hmdH4oWUQpBWq0YC8hKXGu4RSUnvIGZMcqycQxbzgXJiJihjRciyqUy5Oln+d8h/S9qY
         5Kc+sYmSajLS0i9mR3BRX3qaKEHzJ27+VUWX9+aMcm4TfxXIdv4HPceI183uOMG1w+TT
         VuNw==
X-Forwarded-Encrypted: i=1; AHgh+RpNXam/t7QEMXAKi6k7vbDLYM9GxEVGrANqaRNq8N9YnlEY9dihizoheD/bBvA4N5nW9NAtNEQmqKkC@vger.kernel.org
X-Gm-Message-State: AFuF++mvxGqSDCa1aF7n5swdKt7MGIzUcteFYC1JmnPIIE1XvjetRRZR
	ki9SBcob6pQw7vl0GloxzpHboGklCGuVp0SS/Qn0H5KOjtX9Ijg6qL6F
X-Gm-Gg: AR+sD10VG9L40K8QZOmW5adsF3KY8PTWZI0LgS3xb9uWhDpZHmwE07MbbYTfGKS6Wpc
	1Qb/5IM4AlSquipq/qgEaTfjMnoF2ednrM4mN2hxZwuGzRyNKL6zaaMMSmzM5xhO/sLzcZKcyKJ
	8zYqvnhDkALSYFk5m9E9BsrzDYpO1Qt+9JkKqUVyuHR4W7uZ4LTV/4pF8nBHOYNxUXvzCxS9Vpf
	vM78574lsxcynie5nOiRTMjgITc3kJ3slhx9jZApxBYku/7sWkc3kMLCaHXKEcdyFy2wUylQvLM
	aW8ZneYH8ckaKXzVfOKn4XnkWDbDt2nFjvKgdg/og+B1v8ZAyPUip11FuQuQqJ1wa3dHSjkZTmL
	Qmn2DI0oMVr198eEtUZ+f53/VRepVE/MDqKWsY5DkXhjhqHhuS7xyeLiBAXC9B0IBML/KYO2uf7
	8GFUR2eKMulMCLeN0630zSi07Pz9nSlUPvvF6ULoV/2rbBWq0QhpuxWhX2dzsfRiSWzQ==
X-Received: by 2002:a05:600c:4ed1:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49ce582984dmr35814255e9.16.1788334788344;
        Wed, 02 Sep 2026 00:39:48 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4209375f8f.36.2026.09.02.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:39:47 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v2 0/2] gpio: mmio: report the line direction on chips without direction registers
Date: Wed,  2 Sep 2026 09:39:44 +0200
Message-ID: <20260902073946.3709080-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this replaces the gpiolib guard patch [1], along the lines Bartosz
suggested there: instead of teaching gpiod_get_direction() to stay quiet
when a chip has no get_direction(), give gpio-mmio one and let the pin
controller tell it what the pad does.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today every
gpiod_get_direction() there trips the WARN in gpiolib, 21 backtraces per
boot on a Colibri VF61/VF50.

Patch 1 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. It now answers
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that say
where those bits live (Vybrid: OBE bit 1, IBE bit 0) and -ENOTSUPP for
everything else; the debugfs dump, the only raw-register user, reads the
register through its own helper. Converting the driver fully to generic
pinconf is a bigger job than this fix needs.

Patch 2 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context. v1 asked pinctrl from get_direction() itself; the
Sashiko review pointed out that gpiochip_lock_as_irq() calls
get_direction() for !can_sleep chips under the irq descriptor lock, so
the pinctrl mutex is not an option there.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled this time: no backtraces,
and /sys/kernel/debug/gpio shows the right direction for every requested
line (the hogs, the SD card detect input, the USB VBUS regulator
output). Lines the pin controller cannot answer for keep
the input default gpiolib assumed before, so nothing that worked before
is affected. The initial direction scan in gpiochip_add_data_with_key()
runs before the pin ranges exist and still guesses; only requested lines
get the real answer.

Patch 2 needs patch 1 to give correct answers; taking both through one
tree, with an ack from the other side, avoids the window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Mehmet Fide (2):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpio: mmio: track the direction of chips without direction registers

 drivers/gpio/gpio-mmio.c                  | 63 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.c   | 51 ++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 4 files changed, 113 insertions(+), 7 deletions(-)

-- 
2.54.0

