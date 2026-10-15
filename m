Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B233E3D8C
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079550; cv=pass; b=XDbbYgZWuxP6ateq/XIlNENFpj80mOVVUa51R3vYVSJ0va66LkE5Ivg6S1Alu2APt7wk+14Kky9eeyDb1YsSoiEvIgfU+dyWyj2tGUbdcj7tV3GMQ0/3nKCthpt3VtnKleBh5XKCDqIRKtlasJaNn0NNOFHrUU8jn/Z6phrbxhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079550; c=relaxed/simple;
	bh=hWiUxB4D4MIW8N8kxcCWfSDn6lxEelWZrFESkG87aes=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Xgm2exIVHnwHvEkAFwxLH4r88N7cNRnwRhWqw5uluIIoSOYVSwuCkeSjplKV+UIiB7kVPEsRZNk4pi/03dycdeIRTcGzpuRWZN+5DKP1aRtCtSBflmk2yn1SAD2kYkw4uJbaCerIkSXFsrqJYZgG62ngMEbSYhSgAtPLMR6Lhok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MgpY0v+f; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MgpY0v+f"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677dbe051d4so1827533d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 08:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792079536; cv=none;
        d=google.com; s=arc-20260327;
        b=M5G41u/IRcwEhCSd1HIIEy2cZCERJJ6nVwFQWpEfSrFn2e47KBOPXIM6I0zyLy3u9J
         SJcGp3CkFFKZ3KMsAz5eO1drAljz60WzuLLfqNrUjZcctB7RAG+dg5amWxBeKzCLRduZ
         MShNPW4ZTSNGcjsV0VoK5UBuJZzf01v4EST+DKmjHqnmSxU+3EeVrdTfXlKjHBNb5LzT
         zZzRxt9bJxqkQnmtn+/oShqPUGzihfdWqsC4jlFw+8CHkpwDxWH4QyQFv7KbwXin0nYs
         R233bwlq/fA36yzs6OsZOLQXxVRPSMeybBJ4sIYLTYmSzeV4b/Rtlup4japG7qxp65SB
         M/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=asq+PqvjvzjptU3DIDCu1R4E/CeJS68mF9uWIR6gcXI=;
        fh=q4Ia3qBn7VmYSiN1FcRXLDWOXgaE9WGebvHwcl3ibgs=;
        b=dHySyLmLCX+zjbkJRHJVGiWojYVUStNi9w25Xah60EPiLEDUY3vIqbf63HQP5poooI
         1cPnUoFJX1tnk2uCSePHUm0t4t868cuDg6SWi94frJe5dZTenDhm/f/dGSj6KbQjUVoZ
         uoVH6Cl5G1u65nWpwnrn2nc+RM9mlTspfwB/uTQHr9xmAx0uYv9YF065NVxWcCBY5/h4
         x8WVx2W3zXaowRf52oBiUVIpC6ZX6gfs0siBEKScDi55Ob+mATtVQB9r7bTLhVXjUOVo
         yVcymfLcBGOYNERbm/rc9Ca3j2ysmxG8pPGY2swkR8QQ/v57gb1pVFjHn0IUxeCo+cSK
         HyRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792079536; x=1792684336; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=asq+PqvjvzjptU3DIDCu1R4E/CeJS68mF9uWIR6gcXI=;
        b=MgpY0v+fDeMRTzjI9kUQ9RKCSefKzU4mAodZEXaJ6uVv/sxEoz+ZAgI3qiFQo7OwTB
         NlCmEK2nK9Q/tV2M1kK6gGo8DgaB6VU/hJZxH4OqNTv7sojKkibWk9mYttEBrywpXj3U
         RuuDhqm9MrGAIAGV9YptD9/yt0dvDVSIc8Nkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079536; x=1792684336;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=asq+PqvjvzjptU3DIDCu1R4E/CeJS68mF9uWIR6gcXI=;
        b=YRwsHYvWRZ0n9ZWEdEwlzJ2Eng4+JbgQ1UhZrUoL7qWecuj+0EjpPgkBFKk8feX6it
         uXjXdVVvIrB+L7Aac0NBjEj8Hpq+tNX9IiEC3vsLkM1xtKkitRq961sU6VcQFnIOvCy0
         m7Eekbj+Z4aDX3XMriohJv9sf8PYI+QCtLutWoLkUQBZdi9Oz/lNexqXMvG1mNlzkuqa
         ivVl89QPd9i0Bg39J5/1/oFim+3gatOvL38Hk2Y60rEtW0pMTTFTYdmLJWKQrrPc80lQ
         Pz9QSnu5MdKQWd0j4+SOei6I0KFS3VkQLOxMZXUhn1yCfR8ozUgOl1A9EeC7UCNtz/XK
         hO0w==
X-Gm-Message-State: AFq9FYLdaS70JdP1otpdmu0wJ70qbcQ8wuyU7O7wopD1yBwbyEydM3o/
	7AfTpOM1UcMQwyvIfSiV/Et8u+oCxP/r6ZwQFPWYwnFJF4vfb1obS0NF2hdWHTsCSwFpz6OnTwY
	gvFM2O5I60Ca4WozHFHNU1UWQe2wole7m2V/K+JlLPYBV3nf4TPVT3UxO
X-Gm-Gg: AYBFou1G+OxuEw8CdykPnc1CwTl5Kp+26kLurFojKRlcU7fVKQutI34DRVMb4BoAwg8
	Om2KFLfD9HcFZBXF1YPtCM+ffQUUhT7CTCprayJT7ZnZrRI5UQ6aixmKzytOs7uowcRXOTefcl5
	cPV7DePzC/hib1VrLvELhmgcDUQQWT+Lib46lophIQ23qodfP55Z1JhIkeZvTNwm1b29m4GwZk7
	kP4UFwLseX6JGTXghEmbQPw9DRaHEZ5CU/JjMgMF/rsTaJvdMNjH1SUJiD1RC5KyZJhYoFsQMKS
	XZG6FRA4FE9zLvemvJbC1Moc4YBwwYGElZDTfx06n7haMQ8rE7MGw2z8
X-Received: by 2002:a05:690e:4195:b0:675:40a6:144e with SMTP id
 956f58d0204a3-67936065a46mr4178517d50.69.1792079535833; Thu, 15 Oct 2026
 08:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 16 Oct 2026 00:52:04 +0900
X-Gm-Features: AclHuK_ryR54C0PAzAkbNZvfpF8K_oQY8dR3WE9tuX28J6eDhH7nVE2x5HzgOC8
Message-ID: <CAGXv+5GFRCvWf7ahXyGcQHhth2yyOfGuknV1MM5-L2HjEQ4-Ew@mail.gmail.com>
Subject: GPIO_SHARED_PROXY default m?
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I just ran into some issues with GPIO_SHARED_PROXY=m and onboard
USB hubs with shared reset GPIOs causing infinite USB hub probes.

My device has a USB 2.0/3.0 hub connected to an xHCI:

        &xhci {
                usb3_hub: usb-hub@1 {
                        compatible = "usb5e3,620";
                        reg = <1>;
                        reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
                        vdd-supply = <&pp5000_a>;
                        peer-hub = <&usb2_hub>;
                };

                usb2_hub: usb-hub@2 {
                        compatible = "usb5e3,610";
                        reg = <2>;
                        reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
                        vdd-supply = <&pp5000_a>;
                        peer-hub = <&usb3_hub>;
                };
        };

I have:

    CONFIG_USB=y
    CONFIG_USB_ONBOARD_DEV=y
    CONFIG_HAVE_SHARED_GPIOS=y
    CONFIG_GPIOLIB=y
    CONFIG_GPIO_SHARED=y
    CONFIG_GPIO_SHARED_PROXY=m

Logs show an initial enumeration, followed by deferred probes from the
onboard hub USB device driver, because its matching onboard hub platform
device driver is waiting on the shared reset GPIO proxy. And it keeps
repeating endlessly. This goes away if the proxy driver is built in.

So I wonder if having the proxy driver built as a module by default is
a good idea. The user won't see the deferred probe messages, just a
barrage of "USB hub found" messages. I didn't wait for rootfs to load
so I don't know how long that would take with the console going crazy.

I'm sure someone on a Qualcomm laptop will eventually run into this.


ChenYu


Logs:
[    4.635712] usb 1-1: New USB device found: idVendor=05e3,
idProduct=0610, bcdDevice=68.02
[    4.638954] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.639120] usb 1-1: Product: USB2.1 Hub
[    4.639213] usb 1-1: Manufacturer: GenesysLogic
[    4.646597] hub 1-1:1.0: USB hub found
[    4.647489] hub 1-1:1.0: 4 ports detected
[    4.749900] usb 2-1: new SuperSpeed USB device number 2 using xhci-mtk
[    4.762891] usb 2-1: New USB device found: idVendor=05e3,
idProduct=0620, bcdDevice=68.02
[    4.765197] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.765251] usb 2-1: Product: USB3.2 Hub
[    4.765282] usb 2-1: Manufacturer: GenesysLogic
[    4.767921] hub 2-1:1.0: USB hub found
[    4.768475] hub 2-1:1.0: 3 ports detected
[    4.959894] usb 1-1.4: new high-speed USB device number 3 using xhci-mtk
[    4.992223] onboard-usb-dev 11200000.usb:usb-hub@2: error
-EPROBE_DEFER: failed to get reset GPIO
[    5.064595] usb 1-1.4: New USB device found: idVendor=0408,
idProduct=30d1, bcdDevice=0.03
[    5.087992] usb 1-1.4: New USB device strings: Mfr=3, Product=1,
SerialNumber=2
[    5.088091] usb 1-1.4: Product: USB2.0 HD UVC WebCam
[    5.088151] usb 1-1.4: Manufacturer: Quanta
[    5.088203] usb 1-1.4: SerialNumber: 0x0001
[    5.094011] usb 1-1.4: USB disconnect, device number 3
[    5.103773] hub 1-1:1.0: USB hub found
[    5.104225] hub 1-1:1.0: 4 ports detected
[    5.200483] hub 2-1:1.0: USB hub found
[    5.201022] hub 2-1:1.0: 3 ports detected
[    5.206617] onboard-usb-dev 11200000.usb:usb-hub@2: error
-EPROBE_DEFER: failed to get reset GPIO
[    5.212594] hub 1-1:1.0: USB hub found
[    5.213080] hub 1-1:1.0: 4 ports detected
[    5.221829] hub 2-1:1.0: USB hub found
[    5.222331] hub 2-1:1.0: 3 ports detected
[    5.227388] onboard-usb-dev 11200000.usb:usb-hub@2: error
-EPROBE_DEFER: failed to get reset GPIO

and keeps on repeating.
