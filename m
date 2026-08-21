Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B662247CC97
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309787; cv=none; b=F6ldTBAxi4seSSkwJnLu6zNZUYeTeSZcMVY8YBEQxi/2awOMPBqPzaAKqOnT8JP6PB7gMY2npU6EZtwuSRz5zjqokvt2DUIcd08SFpmPs1VfDso3eSN2Ser0ZD8dX5txii/Kky9JXH6Oq6WQvGcMP4Ia4BqF/dESM3Jjs0wDBN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309787; c=relaxed/simple;
	bh=Hszesw6yVqnZ8OpYpwPtsWJaTs2YTlaai6RAYcmBCoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uvfchz8nWBrW7Q5yL0mkDYO/t6akJU0s2Gu5kb4bA9NVIsBnEXCo/OsiaEMlPAmNNITk2kYMYYwaaxWnzRfMX2Wda9jqUpmO3KZAXFHvFsxE3BB+h2urtgM8CwH4fFVx3DRLC051HIKx9ezvw7KkXZwDPF0MXfJJ633KHDyiaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scX3+nWk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scX3+nWk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e347638adso757730a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 03:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787309785; x=1787914585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjmvvNDAO6X5XPPRpkVae2cr18FJFP99cR7ZCryUBd0=;
        b=scX3+nWkH7deRHF+tYx9TbrYJ4/5GCQygA5h6NPUwcxix/Q6E9n2BlgZ0wRLxwslUF
         HXbCqI+8xYhFKjmjddfLt0BUfRn9F1cggrYAj94RpoT/gRmWdkOP50C1CAeuFwi/fmh9
         fHUkjCdVvwlr5Hlq/PlU7Y+dXcqu6Rhl/reN4oE1MKmOtuqlTPJAGW1Z015c4VHhy13W
         luYvF3Fln+sIpfhwQTRnb6UqG/j3o4JZxRKaKq02FnLZUB7ub6j3M+2zvmEqi97Zbgex
         DOM7WmmAPmmsGpPFOFSmi1D6w5NVR5uxXP2/IzT26VSbBuiIm0IgfSplJXlJ0j4M2O22
         sT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787309785; x=1787914585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjmvvNDAO6X5XPPRpkVae2cr18FJFP99cR7ZCryUBd0=;
        b=oaU3BigLSrcaBti7vLOlWcS3ablvT1qgy9HNQAfFBmae6rApNgcYlaoUFA8nCnAEp/
         RcBKkeKDirLxsnzX/CGfqj2ZkonSzM0MT5xRdxVpEccajvkv8VVxLzA2U7aOk+MU/3is
         7HFyCHvsyVYLwV3BsGqEAoZ/NxHK6bNcE+ydWKgorPRDoyz35ilKlLhCwNxVYRUapYxD
         tbcobCcMxDS1BfoVO7vpLEWQQUzQAcdiUk/LTObGeiCCMaryJnIgGllHenprJgOZpHSj
         K2JG96hL7n9xk1Eh2ookkraJ3JRE4lj6RjcMCbHLbZqNCNsQauyZxiMF8XOpdiIJ0pIC
         Yliw==
X-Forwarded-Encrypted: i=1; AHgh+RoslPi8p9RS9QS7Ea03ccL3J3nzATV88ju/rGiusrOWhTP+/1ZIy/DSyhJeU/tRMl59uiJBGxPdrHyW@vger.kernel.org
X-Gm-Message-State: AFuF++n8+2RpLFv4kuHD0eww2nNK6OUAGx7qch+9NaPiSrrIzCtZ1qkq
	rXukDV7UGDU4WoJIlOfFfEUYhS7e8vNDyNJFuMLpgWhMNhbLGxObFUDA
X-Gm-Gg: AR+sD10C0zVPVl5uTw6C7uI+K6fqhbyTdBrA6swaPAGM0eQcpv0kbKKXF20Kjd1Hczb
	nizTeMQl6GpRM2QY5Sp9XJW8RfB7ynnRzoMWiwlBvwERCwlGoFfCsunwMrhBgP8PKOJ4sWRlQ+D
	jAlahKRjSnGcDSUUhvfUXX7rKv5zR8u4uc93Gc+J+RWLHa4lVOv3C7AH+/4g/4626VqLdiq+ESQ
	/S0211RIUqbZEDvjo1BmzNIJgf00ySTRo0j6Au7HoLknm+4Ycwsqu/0g0NfY/7mupu1S/ob5Xj2
	rpxbpWwlU4MWcfB720zP2jfelqeZ0yXPX9DW+kNgjw6xNvJXjTG7qqd6nh5hxOXyJJBmvGgpabc
	6qQ2ATAsoKbzeCiP2+PsNzcBy2EsEzXlXojxusbvG3uHhzcfkm4AY+O/RprkU/UtQqnJlFE/Hlb
	JKYkU+9/VFuo8YMOnC6SmeeBnelTT+XxRuNcKOUWr2+CB42KtFSY8cDJlCtgqgpgDa9Z1wP3++i
	3+/VSaPBPyfZAJ1VyLBCtIiRxqk51XNxplJRdzzySwzDKPd3JOt
X-Received: by 2002:a17:90b:314a:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-395c3522213mr9208574a91.6.1787309784878;
        Fri, 21 Aug 2026 03:56:24 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c467980bsm2692579a91.5.2026.08.21.03.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:56:24 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] dt-bindings: fix typos in various bindings
Date: Fri, 21 Aug 2026 18:56:05 +0800
Message-ID: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors found by the kernel's scripts/spelling.txt
and codespell in several devicetree binding documents:

  - "curent" -> "current" in adi,ltc2991.yaml
  - "deivce" -> "device" in zii,rave-sp-eeprom.yaml
  - "ouput" -> "output" in delta,tn48m-gpio.yaml
  - "redudant" -> "redundant" in trivial-devices.yaml

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml    | 2 +-
 Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml        | 2 +-
 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml | 2 +-
 Documentation/devicetree/bindings/trivial-devices.yaml          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
index e3e668a12..698cc14b0 100644
--- a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
@@ -14,7 +14,7 @@ description: |
   details see ../mfd/delta,tn48m-cpld.yaml.
 
   Delta TN48M has an onboard Lattice CPLD that is used as an GPIO expander.
-  It provides 12 pins in total, they are input-only or ouput-only type.
+  It provides 12 pins in total, they are input-only or output-only type.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
index 1ff44cb22..2210764a8 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
@@ -49,7 +49,7 @@ patternProperties:
 
       shunt-resistor-micro-ohms:
         description:
-          The value of curent sense resistor in micro ohms. Pin configuration is
+          The value of current sense resistor in micro ohms. Pin configuration is
           set for differential input pair.
 
       adi,temperature-enable:
diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
index d073c51c2..e0aacecd6 100644
--- a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
@@ -27,7 +27,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description:
       Unique EEPROM identifier describing its function in the
-      system. Will be used as created NVMEM deivce's name.
+      system. Will be used as created NVMEM device's name.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09c..719b82490 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -186,7 +186,7 @@ properties:
           - injoinic,ip5306
             # Inspur Power System power supply unit version 1
           - inspur,ipsps1
-            # Intel common redudant power supply crps185
+            # Intel common redundant power supply crps185
           - intel,crps185
             # Intersil ISL29028 Ambient Light and Proximity Sensor
           - isil,isl29028
-- 
2.43.0

