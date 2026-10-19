Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792451559;
	b=c9Lg8Ff9SA7CTx9iusmKDh4Ae6AgbcPQLu4fSfpGkI+t7O4HkAv4U8J1p3xvZXiitBmU
	 UsmgyGnj1fZN4B7C1mpKUjsvx3QfmNJDG7eHnR+R1cXQf27ms1qFyA7kvcL82OjprHe/l
	 3htxA8E8iD9GtVYNj+Ok5a1DRZ4u2D+lzqcrXnHF0OCoCSvxtlBxBycwhiiTlFJBFefHA
	 BFFZgtYlu7S38SMVEtUFx954tCICGVLewkDtsf9zoj23YI0Z9NPsPN26NFcTBbOrgZziK
	 JD1oJJo+YqfT34YB41ciGxGhP5CMtWMJ45G8KKN69dcDXO8ZPyGZno6owkkGOJ+Nobw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
	b=rflAm5Q1K896NUR8i71EI1/rCCyR/wI1WG/8mY3fsa24iEOuu31Au2ftvD5MpwwLqNZR
	 km6+EnNQJa8aksFTApNF4r1jv7WCix7nQC8JUjjJTu+ukVYZ6TVGs+EaFr2FZoagUVi/5
	 kW30bCQP/fSS0ih6Mkep4OjhDIcbIx0Sgqbd1GwGnfE8IDTzergI9/ZVGoNE+pKxTr14e
	 ThUhmjhwkBhgGiPOBAnfVpkKdPExVXLetztmpifwxPBbXQdYoNvbvQ/GvmTlONcwRvEsy
	 Xx9GtYLlvmjS7bD6Qyax2hAOmjW4X4GhFdNhfZM945dOPGpPQRObqa+w6qlzN9jr3Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reEuDfUw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7308A606A325
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 23:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7308A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reEuDfUw
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so2173038e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 16:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792451557; cv=none;
        d=google.com; s=arc-20260327;
        b=Z9nL6kpkEX0VTb9wyvP9fRfHjSy0MiedbJwTp0LSb05pN4FPnFGYnL1p4XLvKxdhFX
         QSeH3V8vHqzJBPY1mhZnz9TpGUtCVvN7C4OIIkgiJ2D9Es9hRio8AredCo41DWnG7cdr
         YpgoVwRVfd7yZhY7JzzK+44fgB9UURWdvwbiHKcXiglIOGoRmxhbTk5LaadBrowGrbJK
         W03EdQJo8OM73+74Kly7y0IzoGqgFnJnGpKurw3DR3LHp/6yX+AFD61QOXTcn7RdgyJK
         OQDwNVwcOEXwCgxsfadAJUYKLDW0lEiZVKfE3+ueTeRdb9nZR3+GBGywTfvS1mrIaO/L
         XUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        fh=7KspQGL7TbhoV77zuKhDxG9U1JtP0PpOqyC6nPSkhUY=;
        b=oQUlwdYLqThqmVpqDKM40ATP4KOyMj7Gx7S/HHJKjpQMICoYWPvVEwDqrgKvNCcm1v
         ZB2urlaGh4IXebbcj8W4tZfR9ROSWFhjTgCefAfYmW8PA0kDsIXPG1Hngg45USlmlLXz
         o9BKSkzMltpI2up5Z1vcU+sZlMd1IG+4HPsEAR9nZi7qCQV/7D8pnMe6a8d2LNIiwCeK
         xwXFGoBlVpPZnZ6Dw1mVP6YR2CvTqF4UNEAJbai+yRnQAr9GWtZ9CosUFIicgWqYvqIR
         G3ipIDn5caCiIcClHmFUGnI+zS2/8Cr+w6UD/hIRf5AZjBbxIz0QBt7ayPVIFCyKuElz
         nLCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792451557; x=1793056357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        b=reEuDfUwbnAEKkW57N+I/RTrYm+F8/K5nES2zLeuZDM2Ltbjtp07G6CGpWv/N+52ro
         IJTpq/qjsXVPtc6J2Fhlc7F7KIIA5vxVJV/LEo2U0s3TOyRVYxKZnIIkSgsjJcrI+bbK
         WHK4ojg46O9K/7TQSGCWSVNOV1v+LKgvXa2an97ONQ14rA3NwTo6uUJl1C5ucy9ATECR
         Pw1BlqFTnXzRH+VqJctAXvgvtifV3io3pD9a565yZW48dg4z2J2fFSNyHyKUhfLMEIOD
         ljQeroODXcrVMCeUx+fttMhUkJqYBOdZghBsVugg2Ty1bQqBxYhW5uuqHGZha+COgN71
         qIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451557; x=1793056357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        b=CD07FtqQIKgWgW0vhKbkrY7qVNiGqbJKYpsujWCeL7pkpfMPeSQ7zL9BkCSn0Yj0jF
         xLKOlfIyoG6Puk3zPZKVoU03/yxlrzFX5rZVw7hUsWXe5V3KJTiJ7OxlYn1WRRC1lU0T
         +hiNm7BcECNbT9ndVTD8R3rtfj5oaU+3gZ68lm47tk8IPw188U09X0gndfNkZ6hDKFni
         inEnC8PR0hxX55dJhu/6PTaOs0bjv0MGxwB9UqJHkWwGnEdix5kwgchwVhrmuKdNspvY
         wq5UbpZdDV9igLPUgsxPIfzNe7db7Q6z/SX1o/h6Wy1DuH/yviuYS7WFjimoycBZsx63
         UqKA==
X-Forwarded-Encrypted: i=1; AKwUvBxIhXSh5GfiIcXkkNovxkBeZ2k8sWh84StqruoqwRQg3TtlvX7+l3EXTewz17euex8U45p64y1cqoEg@vger.kernel.org
X-Gm-Message-State: AFq9FYLTl1NIELnui3o34xGg4vHLmpy2CsTkNqahfVj46wnwa5g+84z2
	YQXSDqSXmThPE4G7V+zNXuoyab2l14tOFQLqk+CiOh6svTRNYALfHbJ3ycihmYEIu/lQePYYCgx
	0Ueu8i8g2zLXPZXBJSew/nT4V6eVFADk=
X-Gm-Gg: AYBFou1zYpUVBLtljnvipkjDQ6j1CStqVbZ9R4x6OootUYxzfk8QLM/i+XPB531afFd
	CIqKvEtRZci08lvPJZz9Wmo/E125LDfQCvvJyOnRbXd0V4XyNlLvym1sxwLCO2MpSIDl//ysEaD
	WqOAvBTv7tCdi3KjtdKOcDQqZ+dMQ9CXbF5g0xXwkn4rbIBfoMv15Wai9iR/25D2mHBLhoRPPpi
	vsYgaqYKc9wPj7Sm4jDpfqxN1Oui/XCq5pTJkJ+yshqN9yahtc47jz3V7KslRVQMHV/ck3h6Y1j
	vVfF1IbSASyrcQg2rX4ijahQY+u1SBHjKMX0zlkTUAYgIhg/6ynPomm08oF/DMqQNYXJo9n6AnV
	iVuCfwbBqSzBUgRkP4dXxB3SCqctyCpmqqNAXI3uh9/q5
X-Received: by 2002:a05:6512:32cb:b0:5be:559d:97d3 with SMTP id
 2adb3069b0e04-5be559d9e2bmr2279941e87.25.1792451557299; Mon, 19 Oct 2026
 16:12:37 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
In-Reply-To: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Oct 2026 20:12:26 -0300
X-Gm-Features: AclHuK_sIDCnoT7p4C2M3ArcMmF6PmO_wm6FePSRnR_5IzyNWFoOjbw4PWCxo2c
Message-ID: <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:05=E2=80=AFAM <joy.zou@oss.nxp.com> wrote:

> +       if (!pmx->data) {
> +               dev_err(pctldev->dev, "platform does not support scmi pin=
ctrl\n");
> +               return -EINVAL;

This NULL check seems redundant as pmx->data has already been NULL
checked in probe().

> +       pmx->data =3D of_machine_get_match_data(scmi_pinctrl_imx_data);
> +       if (!pmx->data)
> +               return -ENODEV;

Can this be NULL? If there is no match, the driver would not be probed.
