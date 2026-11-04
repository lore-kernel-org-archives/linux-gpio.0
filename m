Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793764170;
	b=4R1Pe9v+FBVy9i4GIyvFEkfO+FEh668AmVA2LFN9bdWbEXGP7Vi1WiJcxEkeQL4sHwgV
	 HtS+hulmd7C9oeAG3K1/bbuwlZsKtUqk6G/TSE/HIWQjgauu6foDZ5VMNkIhFH7jhoLXi
	 47v/1Kxa1RuLzWYZijceOg5DMcCdb1yXrgN6PaImZ4aoKYkZMv09bZCM7b8Vpmo+YHBBR
	 Olev2yp3xV9xr8MDj70psBEUxGn9p2nsHCAWaax+yH0bRG/smNsaxllz0QExbrzxdcrTD
	 ukeStu0fm5d3jDyA3JJj/GYya4qDTptF+0vjLkiQ45LeeUUYvIKqjQDdSiRI6aU9V6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=9kk3sRi1aculBZU66F60BKhOUZviUp1oqsdUxzqAQDU=;
	b=JEZOE9ODJHU30aytBvFLiI9gdPPPRDTPIX/P1aJotsD8VZPLIJXCT5Jthh2Cmx6uOv+n
	 1yYkeMXBVeCe3Pu6tmX7T9EHoEj3i7cHfO9HmDc4ua8dieFFsH1BIaXTAvS4uW9Uf3RZu
	 tc1bwrogMpLgmKYnmqawMWcclnNY+VVvI54hI1Dpxcy0XGFBjSeBrtO1Za/th5gWKs89A
	 HWMD2D9WFmZzG2ANt6IZDY7xnDVS5CCvP1QnyCxWWW+OeWsZgty3ZdmcTSjLaddhBpyBl
	 W1qbZddu2Q9nrHUVePSWvMR57+DJMIyLmbC7BzpkvaKmEKeuAG49JIFUIUwAvLihrRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QX4+bQ8z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD41B606A328
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 03:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD41B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QX4+bQ8z
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab43af5e97so1972337b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 19:49:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793764169; cv=none;
        d=google.com; s=arc-20260327;
        b=mcaz0CCEkNJlJn2btWTzTb1fM3NvxKALi+OgxuGAPzu7KE1SmUei6t0dhmU5yboTnz
         nRADldaaNfYq9+FfgeCT3I8FoE5wvzEHaNruvx4KrdD9zp5mGRba+K9XZpYKDLwa6R97
         pkbNNWpJLrcx//H71FTspTtuNCbWOqZwBR8Q7THebA05fXBYISUgfzsPKMTJ5NExIYhE
         XyydWEmGXfJAfa1I7n88IGE73wSNd0XkC1JwLhwKP5KIcrtYA2rGkIaj8iamngKUG41o
         UnCecDlZRkQJi82OANl8sjHO/sLVhc9a10CgJTMEtNZ+lF5BQ6EKTxbMZVN5wFMdJ/P7
         WDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9kk3sRi1aculBZU66F60BKhOUZviUp1oqsdUxzqAQDU=;
        fh=XeQ5oNNzHJNMstenT9fcPyL+WTyA0iyWi6zMlJpg0gs=;
        b=snMfLbqRwOjzf1Tc38IKKZeDer9cNxU63k3xoeS4P3PISRxXzrq+vaAPvW2rhlDVze
         ptReo9sWsYp8ZiLrhivXxX+eebgTXuaEIFH/IJmDLdRDawmX+X56LhP2ZCeShXsu/Rit
         zMxOoH//25hU9psr8JkAxLEffNqtRvoWjuZL5Pn0nGLIZfJa47MEk7cqZjoLuKmp3lOj
         773vda7gw+EJzWvLTTY1l2u0Fw20EAwuzEnsSH7vmWT86DSvsHyHIQRhTbzmiZdkCGfL
         fbSLthAxgG1B9Gd3BHKZif2oJ0bMJjEADWRBZg8CFuT7L77IptuOeqcE8ANtVJHTez9l
         H0qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793764169; x=1794368969; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9kk3sRi1aculBZU66F60BKhOUZviUp1oqsdUxzqAQDU=;
        b=QX4+bQ8zoxlrWwjOV/4XKxLrHp+r226YaAyUc0hUh81gn5tdBoZsl7JVkbyFeyu/UF
         n29QuGrxw2uiHWChosGBHbe0U52WIObTMSbFVJItv0uNEMz67g8e+MiGrOyCKmUV2p3t
         jxmHlonE0u0gfZfzVQ7svLab5Q/FZi6rKdAkdlAdIrXB6TdbDrhUGwWrAd381poGmBgC
         YfjgUkwDixqCyWo2mwfx3wHasv8mEfgrBH8cUym9wH1u/CMFB5JYaXS8hLuklEQsVqCl
         mzBFvYWFnu9zxELItARoYsOiEG+KvZPHC9HG4a0k+LYBhv+YpgDDjfd5gtYWHhbTvdH9
         RzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793764169; x=1794368969;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9kk3sRi1aculBZU66F60BKhOUZviUp1oqsdUxzqAQDU=;
        b=J2PB19afFzElmmIb6aQWa6fuMihtHTgKfcZ5DN+ckk2ZzNbE8q5mbngzexBQCrpe6h
         mVGr7tbO44N0fHB5b70SDJzJEcZy5AlTlTHC5zwRKab4AYo1/C0n8lkW1C0vnp2LkvRs
         lgb2LW17UoLnjOQdP0LT6s+vdt0tFGyCU2Jtfohq88HG3JYEVbmKlTJN7RL/MMkKIwA4
         +qYS1JdKqznaS781ye2nwpRpvQxRLyuL0h7yqwVBuqOxCQt3e79/s0oIHWL9jHDEfQJ/
         DmD396P9VNZr0kgXBGHkMljmZK/OEvFW0pzX8IWKq1BwlVoYq3rmFhaF1sPnAqvM3zY4
         EMIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxl5hSX85klX89io+1Kptga/7zpuiWR5n/UKLXFtm7mXPAtz5gz6tO4hPwkLKCiglf5V0WNUTzi5xEJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+MOxliLhSC/6/HjDApy6CooDy+AZF5CIq9QqTci1ubV1T2EszD
	AbyyxEX4KAzHNs7Hh8qCavEDP+2sN46ZdCGoImp0wqWiaGmoVn+jdOepEcNgQbzX6wstAvoALfp
	3ilaGQrKp+5slR8jdiVW88Cz/UVDWu6F5zoHypFY=
X-Gm-Gg: AYBFou3/MHh8vYItOcbFQHriXBUZ0WOhZk+9z2rdb02wFNLCGLmzcvazBINauaDk6A9
	2NMy8QZGb2ZGaZKvjW0j350/2MBvOBUhLzA/oOhoyBmoBiPURvelkHsfZpCI/coko1t8YF4SEAz
	m2KYb7jsQqio8PzVpanoG2Y60HpQD4dpGmp5qXBiDgey5/ZkuHETL1VyYR0GjImo9NuocUZG+Zv
	PxUs18dnPasXU8wRR8EzeU3Y8QfTHGsmfSrfrt16nFzguoEhqLjJN4BC3j4CVvmx8AwsN3oFwG7
	G3Y2KppCHSdnlYfqkyajWmnr3ziA7V6qx24rQ6DuJlpmetFBN4Rax8FAXUDk0xVkdqGVxpFZMrr
	oN3lAKDrU+ns1MtIL4pRC8BDH4wd+vpMV4go7Rw==
X-Received: by 2002:a05:690c:f90:b0:8ab:3b98:5a30 with SMTP id
 00721157ae682-8b1c68babdfmr128642167b3.33.1793764168725; Tue, 03 Nov 2026
 19:49:28 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Marc Taylor <marctaylor700@gmail.com>
Date: Tue, 3 Nov 2026 20:48:52 -0700
X-Gm-Features: AclHuK_kx1iiAU8XRRGnC7TaKzisocPDFXhmTTmqtetI1Obl0uzsvk2UQA3gpMg
Message-ID: <CAKNLDZPXzah6h_rj3YmZtf+WvAbFRNVxr2XGnRnuUpfMH-PB0A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] reset: add support the GPIO provider with #gpio-cells=3
To: bigunclemax@gmail.com
Cc: p.zabel@pengutronix.de, brgl@kernel.org, krzk@kernel.org, 
	linusw@kernel.org, andre.przywara@arm.com, martin.botka@somainline.org, 
	dlan@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: multipart/mixed; boundary="00000000000016b0ca065f6b4451"

--00000000000016b0ca065f6b4451
Content-Type: text/plain; charset="UTF-8"

Hi Maksim,

(Re: <20260423230338.442497-2-bigunclemax@gmail.com>. I'm not
subscribed, so this may not thread; sorry. Adding linux-sunxi.)

I hit the same bug on an Allwinner H700 board (Anbernic RG35XX Plus,
sun50i-h700-anbernic-rg35xx-plus.dts: RTL8821CS SDIO Wi-Fi behind
mmc-pwrseq-simple with reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>) on
v7.2.15, and the code is unchanged in v7.4-rc1. With CONFIG_RESET_GPIO
enabled (arm64 defconfig has it =m):

pwrseq_simple pwrseq: error -ENOENT: reset control not ready
pwrseq_simple pwrseq: probe with driver pwrseq_simple failed with error -2

mmc@4021000 never probes, so there is no wlan0. With RESET_GPIO
disabled, pwrseq_simple falls back to plain GPIOs and Wi-Fi works.

Two notes on the RFC:

1. It no longer applies after the reset-gpio rework that landed in
v7.1/v7.2 (fwnode_reference_args, __reset_add_reset_gpio_device()
taking a fwnode, fwnode_reset_n_cells).

2. I think the 3-cell software node reference resolves to the wrong
line. gpiolib-swnode reads the reference with nargs = 2 and uses
args[0] as the chip offset and args[1] as the flags. With
<bank pin flags> stored in the swnode, PG18 would come out as
offset 6 (PA6) with flags 18. If the CB1 works with it, I suspect
the real reset line is simply left deasserted. (Code reading only;
I didn't run the RFC itself, since it doesn't apply here.)

Attached (and below) is a port to v7.2.15 that asks the provider's
of_xlate() for the chip offset, so the swnode stays <offset flags>, and
skips the reset-cells check for the GPIO fallback (reset-gpio says its
cell count "is not really used"). On the RG35XX Plus with
CONFIG_RESET_GPIO=y:

sunxi-mmc 4021000.mmc: allocated mmc-pwrseq
mmc2: new high speed SDIO card at address 0001
rtw88_8821cs mmc2:0001:1: Firmware version 24.11.0, H2C version 12

/sys/bus/auxiliary/devices/reset.gpio.0 exists, debugfs shows gpio-210
(PG18 = 6 * 32 + 18) requested as "reset", out hi ACTIVE LOW, and Wi-Fi
associates and gets a DHCP lease.

This isn't a formal submission. I'm happy to test a v2 of yours, or to
turn this into a proper patch if that's preferred. Philipp's earlier
suggestion (pwrseq_simple falling back to devm_gpiod_get_array() on
-ENOENT) would also fix this board.

For the approach below, on Anbernic RG35XX Plus (H700):
Tested-by: Marc Taylor <marctaylor700@gmail.com>

--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1019,12 +1019,13 @@
int ret, prop = 0;

/*
- * Currently only #gpio-cells=2 is supported with the meaning of:
- * args[0]: GPIO number
- * args[1]: GPIO flags
- * TODO: Handle other cases.
+ * Supported specifiers:
+ * #gpio-cells = 2: <offset flags>
+ * #gpio-cells = 3: provider-specific (e.g. Allwinner <bank pin flags>),
+ * translated to a chip offset by the chip's of_xlate
+ * The flags are always the last cell.
*/
- if (args->nargs != 2)
+ if (args->nargs != 2 && args->nargs != 3)
return -ENOENT;

/*
@@ -1034,8 +1035,7 @@
*/
lockdep_assert_not_held(&reset_list_mutex);

- offset = args->args[0];
- flags = args->args[1];
+ flags = args->args[args->nargs - 1];

/*
* Later we map GPIO flags between OF and Linux, however not all
@@ -1046,8 +1046,7 @@
* flags.
*/
if (flags > GPIO_ACTIVE_LOW) {
- pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
- flags, offset);
+ pr_err("reset-gpio code does not support GPIO flags %u\n", flags);
return -EINVAL;
}

@@ -1055,6 +1054,33 @@
gpio_device_find_by_fwnode(args->fwnode);
if (!gdev)
return -EPROBE_DEFER;
+
+ if (args->nargs == 2) {
+ offset = args->args[0];
+ } else {
+ /*
+ * The software node built below is resolved by gpiolib-swnode,
+ * which only understands <offset flags>. Let the provider turn
+ * its own multi-cell specifier into a chip offset.
+ */
+ struct gpio_chip *gc = gpio_device_get_chip(gdev);
+ struct of_phandle_args spec = { };
+ u32 of_flags;
+ int i;
+
+ if (!gc || !gc->of_xlate || !is_of_node(args->fwnode))
+ return -ENOENT;
+
+ https://www.google.com/url?q=http://spec.np&source=gmail&ust=1793850302384000&sa=E
= to_of_node(args->fwnode);
+ spec.args_count = args->nargs;
+ for (i = 0; i < args->nargs; i++)
+ spec.args[i] = args->args[i];
+
+ ret = gc->of_xlate(gc, &spec, &of_flags);
+ if (ret < 0)
+ return ret;
+ offset = ret;
+ }

guard(mutex)(&reset_gpio_lookup_mutex);

@@ -1193,7 +1219,11 @@
goto out_put;
}

- if (WARN_ON(args.nargs != rcdev->fwnode_reset_n_cells)) {
+ /*
+ * For the reset-gpio fallback args is the GPIO specifier, whose cell
+ * count is the GPIO provider's, not the reset controller's.
+ */
+ if (!gpio_fallback && WARN_ON(args.nargs != rcdev->fwnode_reset_n_cells)) {
rstc = ERR_PTR(-EINVAL);
goto out_put;
}

Thanks,
Marc Taylor

--00000000000016b0ca065f6b4451
Content-Type: text/x-patch; charset="US-ASCII"; name="reset-gpio-3cell-v7.2.15.patch"
Content-Disposition: attachment; filename="reset-gpio-3cell-v7.2.15.patch"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

LS0tIGEvZHJpdmVycy9yZXNldC9jb3JlLmMKKysrIGIvZHJpdmVycy9yZXNldC9jb3JlLmMKQEAg
LTEwMTksMTIgKzEwMTksMTMgQEAKIAlpbnQgcmV0LCBwcm9wID0gMDsKIAogCS8qCi0JICogQ3Vy
cmVudGx5IG9ubHkgI2dwaW8tY2VsbHM9MiBpcyBzdXBwb3J0ZWQgd2l0aCB0aGUgbWVhbmluZyBv
ZjoKLQkgKiBhcmdzWzBdOiBHUElPIG51bWJlcgotCSAqIGFyZ3NbMV06IEdQSU8gZmxhZ3MKLQkg
KiBUT0RPOiBIYW5kbGUgb3RoZXIgY2FzZXMuCisJICogU3VwcG9ydGVkIHNwZWNpZmllcnM6CisJ
ICogICAjZ3Bpby1jZWxscyA9IDI6IDxvZmZzZXQgZmxhZ3M+CisJICogICAjZ3Bpby1jZWxscyA9
IDM6IHByb3ZpZGVyLXNwZWNpZmljIChlLmcuIEFsbHdpbm5lciA8YmFuayBwaW4gZmxhZ3M+KSwK
KwkgKiAgICAgICAgICAgICAgICAgICAgdHJhbnNsYXRlZCB0byBhIGNoaXAgb2Zmc2V0IGJ5IHRo
ZSBjaGlwJ3Mgb2ZfeGxhdGUKKwkgKiBUaGUgZmxhZ3MgYXJlIGFsd2F5cyB0aGUgbGFzdCBjZWxs
LgogCSAqLwotCWlmIChhcmdzLT5uYXJncyAhPSAyKQorCWlmIChhcmdzLT5uYXJncyAhPSAyICYm
IGFyZ3MtPm5hcmdzICE9IDMpCiAJCXJldHVybiAtRU5PRU5UOwogCiAJLyoKQEAgLTEwMzQsOCAr
MTAzNSw3IEBACiAJICovCiAJbG9ja2RlcF9hc3NlcnRfbm90X2hlbGQoJnJlc2V0X2xpc3RfbXV0
ZXgpOwogCi0Jb2Zmc2V0ID0gYXJncy0+YXJnc1swXTsKLQlmbGFncyA9IGFyZ3MtPmFyZ3NbMV07
CisJZmxhZ3MgPSBhcmdzLT5hcmdzW2FyZ3MtPm5hcmdzIC0gMV07CiAKIAkvKgogCSAqIExhdGVy
IHdlIG1hcCBHUElPIGZsYWdzIGJldHdlZW4gT0YgYW5kIExpbnV4LCBob3dldmVyIG5vdCBhbGwK
QEAgLTEwNDYsOCArMTA0Niw3IEBACiAJICogZmxhZ3MuCiAJICovCiAJaWYgKGZsYWdzID4gR1BJ
T19BQ1RJVkVfTE9XKSB7Ci0JCXByX2VycigicmVzZXQtZ3BpbyBjb2RlIGRvZXMgbm90IHN1cHBv
cnQgR1BJTyBmbGFncyAldSBmb3IgR1BJTyAldVxuIiwKLQkJICAgICAgIGZsYWdzLCBvZmZzZXQp
OworCQlwcl9lcnIoInJlc2V0LWdwaW8gY29kZSBkb2VzIG5vdCBzdXBwb3J0IEdQSU8gZmxhZ3Mg
JXVcbiIsIGZsYWdzKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCkBAIC0xMDU1LDYgKzEwNTQs
MzMgQEAKIAkJCWdwaW9fZGV2aWNlX2ZpbmRfYnlfZndub2RlKGFyZ3MtPmZ3bm9kZSk7CiAJaWYg
KCFnZGV2KQogCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKKworCWlmIChhcmdzLT5uYXJncyA9PSAy
KSB7CisJCW9mZnNldCA9IGFyZ3MtPmFyZ3NbMF07CisJfSBlbHNlIHsKKwkJLyoKKwkJICogVGhl
IHNvZnR3YXJlIG5vZGUgYnVpbHQgYmVsb3cgaXMgcmVzb2x2ZWQgYnkgZ3Bpb2xpYi1zd25vZGUs
CisJCSAqIHdoaWNoIG9ubHkgdW5kZXJzdGFuZHMgPG9mZnNldCBmbGFncz4uIExldCB0aGUgcHJv
dmlkZXIgdHVybgorCQkgKiBpdHMgb3duIG11bHRpLWNlbGwgc3BlY2lmaWVyIGludG8gYSBjaGlw
IG9mZnNldC4KKwkJICovCisJCXN0cnVjdCBncGlvX2NoaXAgKmdjID0gZ3Bpb19kZXZpY2VfZ2V0
X2NoaXAoZ2Rldik7CisJCXN0cnVjdCBvZl9waGFuZGxlX2FyZ3Mgc3BlYyA9IHsgfTsKKwkJdTMy
IG9mX2ZsYWdzOworCQlpbnQgaTsKKworCQlpZiAoIWdjIHx8ICFnYy0+b2ZfeGxhdGUgfHwgIWlz
X29mX25vZGUoYXJncy0+Zndub2RlKSkKKwkJCXJldHVybiAtRU5PRU5UOworCisJCXNwZWMubnAg
PSB0b19vZl9ub2RlKGFyZ3MtPmZ3bm9kZSk7CisJCXNwZWMuYXJnc19jb3VudCA9IGFyZ3MtPm5h
cmdzOworCQlmb3IgKGkgPSAwOyBpIDwgYXJncy0+bmFyZ3M7IGkrKykKKwkJCXNwZWMuYXJnc1tp
XSA9IGFyZ3MtPmFyZ3NbaV07CisKKwkJcmV0ID0gZ2MtPm9mX3hsYXRlKGdjLCAmc3BlYywgJm9m
X2ZsYWdzKTsKKwkJaWYgKHJldCA8IDApCisJCQlyZXR1cm4gcmV0OworCQlvZmZzZXQgPSByZXQ7
CisJfQogCiAJZ3VhcmQobXV0ZXgpKCZyZXNldF9ncGlvX2xvb2t1cF9tdXRleCk7CiAKQEAgLTEx
OTMsNyArMTIxOSwxMSBAQAogCQlnb3RvIG91dF9wdXQ7CiAJfQogCi0JaWYgKFdBUk5fT04oYXJn
cy5uYXJncyAhPSByY2Rldi0+Zndub2RlX3Jlc2V0X25fY2VsbHMpKSB7CisJLyoKKwkgKiBGb3Ig
dGhlIHJlc2V0LWdwaW8gZmFsbGJhY2sgYXJncyBpcyB0aGUgR1BJTyBzcGVjaWZpZXIsIHdob3Nl
IGNlbGwKKwkgKiBjb3VudCBpcyB0aGUgR1BJTyBwcm92aWRlcidzLCBub3QgdGhlIHJlc2V0IGNv
bnRyb2xsZXIncy4KKwkgKi8KKwlpZiAoIWdwaW9fZmFsbGJhY2sgJiYgV0FSTl9PTihhcmdzLm5h
cmdzICE9IHJjZGV2LT5md25vZGVfcmVzZXRfbl9jZWxscykpIHsKIAkJcnN0YyA9IEVSUl9QVFIo
LUVJTlZBTCk7CiAJCWdvdG8gb3V0X3B1dDsKIAl9Cg==
--00000000000016b0ca065f6b4451--
