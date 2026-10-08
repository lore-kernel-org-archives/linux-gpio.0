Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEDB3CEBB1
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442519; cv=pass; b=hyqvNr4hj7JPOmkszXyykANcmAjEOTW79vrJ9/2ccB6LXdi3qozXipOGezoY81WBnlSFV01PaWOTd9IfB2D+t5f1pD7H8eG3Q4DRJP/DkB3IV90c1lw+imsUXiT9OxpKUKfgkN/57i+OZyQ6ILRXaF3IWWU/w7+jH23Wx5WgOaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442519; c=relaxed/simple;
	bh=LAU+lAaONCsbyhUKz3NVx/NrIoGX2BWhWJ83XVPrkW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QF1KTZAPMz3m2GpT8p8X7R+n5L0dBNqlikSNGm8WDofGpXaWRSyTccx3m1dGkL/D621PWCwnCYtrFXM0p4AWVfdKkgof6+0w7LjLnhxl0t+z37hLGkNNfp/a5vkUqn4sefL81eC4MxeAeFIqm/9WxSA5mWCJ176ywNkDtQJWr20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfA82dpf; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfA82dpf"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8897e83332fso153687b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 23:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791442517; cv=none;
        d=google.com; s=arc-20260327;
        b=lthrKvVH0lCnnVBO77NzmETg1mpll6OKdk7TFkFdTO8iZiatyJU5TLW564uYBuY39p
         68iQQU/WdIs2CKewt8/mqLabLCtmrSjI/eZ8SczxoZCuizz2f7K9N9oZopwiuA6k5dH1
         u6rNyHwHIIlpmVrprl1zKOIeXMrYPoWLLug6x8JOeoPYcocYwJHhe9S1jaVcsvatl22H
         lTc/p3isiKbULXfbnfE3KBBGmB1KLbTFIYStJJIYtMuLh8vdaD4e3EDzJUA9ozCfcgvD
         b0hi2SKFdy8QR7ok5LI8T+FWTfy92o6DIHREURn/R5UQUWa3jsNKfqteyFQuIXRkZim/
         kvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        fh=1Hkp8xWvhmyUrXJxRyf5Bri3DCRl0B3ViXxwW7Jh3H8=;
        b=ZWpZXXW4Q/M/q+4OXzgOQXd+XfhBpYXArNTE/QAIhVh7itBboKgh9SdHlfYb7VBX04
         ZynpghjTDdgYLwmRp7DwHsWG+pVxGLgIMFV2bMK2zMBTKBvDoirbzsXDVgw62ZsVLyym
         OwbrO59e3awbjmdclzoYwam9jpIqEA0Sm61RCGBI3N7Au87XCciQUnOXFd9zpAt5MD18
         fdKOTZj6UU9HtQpruCNfJRp6/nEkS3f1R6diMbADuVui46pXltEeilup0E0sn7dpv/2/
         uXqYA12RgpyQS8JrHSOJZ2zU9GU8Zn2k0ZL3e/5B4jWwbrCX6DN1+xf5UiBu+1mYl5vs
         H6YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791442517; x=1792047317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=JfA82dpfOuVdgDazmoj+VL39H28VT2HM/BiZqQZJLKkhrONqnBZQI1g2IBB/YAezCp
         6L2ubSBVe7N+kSpJVblp3DxCS3QFHffRp7ePqiVmBSfI1V/vjwFIBlMd1qJ4l4kBQIv4
         Opbe/QAL89fcInWCeq/8guMlRNDWPIlLPp2agXMGzHX3kkQg1o/eTc4BpI804+3EKajh
         I1+qVcp7TiVFxpRrFeQSiHHyhMZgA7R5+Cn4dfaxcaqdNZfUzVEnizuh5hm+2RT5/bQE
         6FHQm5V6Qstlbv1jjfx7+8ntKfjKbTlKdt4MagxOtQ1q7B+zXWjJEO8vL3ZYs4YpJ/lZ
         Dauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442517; x=1792047317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=oRaQ36X5GIQUW2usuVLiD8MRbECI5MnS35GsjSlTo+SQDuhTqm2eTw6a2X1SZDOPz5
         cH1i7LI/44SZbOuNR8xe/8D0npMBveVmhgtmGMIprdh/xUfxYe1oZ3dIEQb1pbqn9JYB
         qVcLaW5AE7LCZMXt13rZLLJy7AdcS+UEPNgdJKBapseGFQh6+jvPk34tYTh9SBiMvK5m
         7F7kBP32T3ygRFpPoRuswc7vtHJpvZpW6XIUQ9R/Fkw34fSuj6k2kJxKK9Yyx3iGhlQD
         XBaBOHCixgK5pOH2PTuCd02o80pStk7P0/R18b13z3i/Z+EUOfFhOBVhz6ITWKclv5ei
         aTXA==
X-Forwarded-Encrypted: i=1; AKwUvBwpAIZpXZr7DFSrlDLmD8Np9tufHjYgOyGSzd17EIIXSAoSLG2dYCoqbToHbcbq8AtjqIFjSAXFFtHt@vger.kernel.org
X-Gm-Message-State: AFuF++mzMU9OGx3UITOO44xKHt6kY0ww0yfQtAFycIcQbN56KeAFsykb
	DMZH6na87I9zA27UAEOvgQl2Iq2N/9hb22tkYpzv7tlm45uR2lnIJOnYjK1LXRDHifVEa28YbTJ
	/PVvIXPUexVlW4nS9tYsIbculJrj8J2o=
X-Gm-Gg: AYBFou0pn3Pj/M8mWYKU/aW3KuVrKOv0sfVa8vUWevDs1WHz2OZSsla7OpwqzIt8Iqo
	jutb1JQLXY944lvB+wWmRTVSKrWwOiOUni2x9qAncWEZ7O5kKUfkmzDUzBpu7Sk1MJSN0g5GHDD
	+8vtPv9lWfNED/fjpnPFH47t5ImcvEBlAfprJVTw+wGz2R+yX2ycznCFtYuH6m+WhT6cRoqpPoV
	Xn2DU4WkZOloeWl3Lt1b3vFnJAUF9/k3nUKCnSDGpL/Tyn0XxruZqZ8iFf+BreVsC6BQSuvSQMU
	nc0pkDzu3UbFZ+2BdNbw+tE2m/+3f7xHAgn3V7Y6Ze8OM4V/0HXSU3ds+RoLeMXd5L63hlY=
X-Received: by 2002:a05:6a21:3e09:b0:3de:3bfb:dc65 with SMTP id
 adf61e73a8af0-3e14c5a1255mr1132038637.34.1791442517344; Wed, 07 Oct 2026
 23:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005202731.153971-1-pmazzini@gmail.com> <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org>
In-Reply-To: <20261007211626.GA338242-robh@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 8 Oct 2026 07:54:59 +0100
X-Gm-Features: AclHuK9HNWmbYmgrwOCN8Dj1r6Aaf0O489JwabVju8_e_8zgAdvV8DQG3O2TPc8
Message-ID: <CAAxh=jsoFDfNGEtcWvxe5VNH-knf8LZg9aVh800LF9t-7m1qbA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
To: Rob Herring <robh@kernel.org>, andre.przywara@arm.com
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

The B288 uses the same scheme as the A523, and the A733 queued for
7.4, which the shared pinctrl-sunxi-dt helper parses, so I'd rather
stay consistent with them.
Andre, what do you think?

Thanks,
Pablo

On Wed, Oct 7, 2026 at 10:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Oct 05, 2026 at 09:27:23PM +0100, Pablo Mazzini wrote:
> > The B288 driver takes its mux values from the DT, so allwinner,pinmux
> > becomes an allowed property here, required for this compatible only.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4=
i-a10-pinctrl.yaml
> > index 45b7a0b6c626..b1f093d218f5 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > @@ -39,6 +39,7 @@ properties:
> >        - allwinner,sun8i-a33-pinctrl
> >        - allwinner,sun8i-a83t-pinctrl
> >        - allwinner,sun8i-a83t-r-pinctrl
> > +      - allwinner,sun8i-b288-pinctrl
> >        - allwinner,sun8i-h3-pinctrl
> >        - allwinner,sun8i-h3-r-pinctrl
> >        - allwinner,sun8i-r40-pinctrl
> > @@ -120,6 +121,15 @@ patternProperties:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >          enum: [10, 20, 30, 40]
> >
> > +      allwinner,pinmux:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Pinmux selector value, for each pin. Only used by SoCs whose
> > +          driver takes the mux values from the DT instead of an in-dri=
ver
> > +          table. Almost every time this value is the same for all pins=
, so
> > +          any array shorter than the number of pins will repeat the la=
st
> > +          value, to allow just specifying a single cell, for all cells=
.
>
> Perhaps new platforms should move to the common 'pinmux' property?
>
> Rob
