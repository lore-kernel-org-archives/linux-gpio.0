Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392041B4F09
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160323; cv=none; b=LH8bh3NTb3ngBv9H8iv11s5HY1jFyHW9dR3RWvbjCDQK7K/fw1do7H7G8+d+O49qlnRy3+2S+8+SVqyn3vogZXhwvqQwH7kWDYgywCrvJJwnEB1ikeanXH8jhRv8XRkLjefXB3D7cGVEn2iIWTLlPWXsAW6wRMPG9aUzjJ1W3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160323; c=relaxed/simple;
	bh=ZhUjSiiD071KdCSmFriA8h/i4UpI4k09nR2tb1ZrMsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1447+Jne8AJoqTDqv8Oz1/B1OcPGh0KRUDG8T2LQMdgO5PJUb5E5auZ2sh6fLIpdTDnBqvdHGOfYMzMlBrXjFFQtw+dZGJaVYiU9UfzCIkYwHDqv6Au2AzcEm1hG80gKoO4thEpeD3KRoxZguR4Xg8Z/MRbRPn2kY6OP44p+qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1YiwT2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsfDgauQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1YiwT2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fsfDgauQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6Al93006162
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrQWNtvANTxFjZ2lZH6WoSLuvyi8kSELqVpeXKG8CVg=; b=N1YiwT2UGMfYL4pQ
	sSpb+VrOFIInjDIodl9nvHVOdn5U1+vAsl5G7HA+f2LyiKcd36KnjWg5b8BzHm33
	WB0cR8kjWMsMNILpZMzfvT4Vv3UWdswgXb+oTGGxFemjFlRL9X7fdbFazROFrfgt
	BFKJLtAQuJNqkcgdY3tldmu5rJoghCEDIdi3Hw8/cwTJYUI2cyyuSBYZdGJmFyxl
	bnmCjn69uvpH0P5q4KueBoiA1ejKqlRx3K78UmEMjYYYnbc2u3B7kVrzBZhVI7i1
	GA6cgyW0PFytIFeYGuf1cYc9fhGA6dMIPBurxz712oAaEjvrm7YJEOguC7JvmNrP
	tlOWKg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa437q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c88cefeb3so314768241.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160315; x=1792765115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrQWNtvANTxFjZ2lZH6WoSLuvyi8kSELqVpeXKG8CVg=;
        b=fsfDgauQiIZ4dwNxtOYDXhXFtoyFGdzUmXpex/EDPInYkdxP9jb7UGm0QkJC0QgkCr
         Bz+WrC6EqDWcFIhyZpoGQfX+O6ZVfBxQotlBHfs4sE8SZfCNYySQ3Nw9x89ZMHugIxKC
         kbeAX97RQbw0M+hfOtim9H/aFSXmuRcZIuvGTC54hs4FRy27Qj0mtKY/dfd9P3KHsF3o
         NaDga/AljrDzlrWQEn6neEg4MB00MwsaCIcbCCBECme6zq/D7G2jRBqjw6XS6jeUyRGs
         kwYNbL2KUvBmvvKF2+n46VTkWmz9p7sDxhTWkDonQQkXkImO1eIuL+qgXXAlFIPeIzHM
         +2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160315; x=1792765115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrQWNtvANTxFjZ2lZH6WoSLuvyi8kSELqVpeXKG8CVg=;
        b=sHdG4a1sVV9xB99CzslBvv+i6r98h7knqInEjGNiMi5Idp04hHRrr/d+lPWra4wK5G
         ZAR0mknA/EvKRvrR6Lh7V5D05g9lfSFea8DPVHxxBzdfgm7mJyQDzIEUColbv3x6TS5O
         elQ627ZxKFCAANVhbpHkNeUjYHNTu0GMcOXXq/NJINS/Zu2uoaLNzhavAmQOcncLOW12
         6GQwKopFzOscoEo/dkLKjO9IOc0re5oTcggwNY2aZpCOW1HW9EdijsgTm4ONfXCgQXVq
         Vz9ObKqxo1HqGQQNCoqC/RE4j5D4J7Kdd1D+CsTuzrrn6iI5n0pwCySH56OyP02sHkHP
         Y4GA==
X-Gm-Message-State: AFq9FYIHIPgLd372dBxnSuZ48TLY3gZSXfkMd/qhN2LkUcW9tPtukcj+
	pxQSkud8R5LKUXo8YCRu1P2Oo+1SvXA71TQrBC2HJ1imgb9z2N9xMTjNXRrrGWobTTe1FxMt03W
	YR/Al4ts1Z4/XBiL0o++tRhE6Pqi0kiD2QZZ9uMOgRpE3/VeeyBoS6o1xaI3ppipp
X-Gm-Gg: AYBFou3Ye2UyoW+TZYg1fVuVv7/pI2aLnobwWx/dXlxQSrqZLgqANKiYtOFD5Zcs4gO
	j1jcvq/HkXHYYPfXkwp7x8yqQUywFyooMIaexPVRICdCfub7B+fub/oP98WrIToSFF4hYG8bZLg
	4NFJXExGm9ENkgw9ONHiZOl8h4QMP9Vf9I3Rbwv7UBrg+2qiIN8JdKSSoizmCmTAPqA8w7YytHd
	5iOp5yFhVvSIVOrIpPTdTDMo5CM1daiwwACklgoKhUaIbDgybQVirjWj26jWqIB7LH6ndNG0rsq
	PiXBuC68Ywpdr1jNqi+SWhSLnkeK5Ix6x5AklZKXO14G/e4AxMcf7mwklfKpiS5zx0pBPxnxVdG
	dC2G08mU2qSftspLPuljhpj23Q+dr
X-Received: by 2002:a05:6102:4bca:b0:7b9:fbff:6f9b with SMTP id ada2fe7eead31-7cb3739b226mr7184664137.28.1792160313203;
        Fri, 16 Oct 2026 07:18:33 -0700 (PDT)
X-Received: by 2002:a05:6102:4bca:b0:7b9:fbff:6f9b with SMTP id ada2fe7eead31-7cb3739b226mr7184647137.28.1792160311848;
        Fri, 16 Oct 2026 07:18:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de682bsm58835365e9.13.2026.10.16.07.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:18:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:18:10 +0200
Subject: [PATCH RFC libgpiod 3/3] tools: implement gpioctl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-gpioctl-v1-3-8770622679b8@oss.qualcomm.com>
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
In-Reply-To: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=134433;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZhUjSiiD071KdCSmFriA8h/i4UpI4k09nR2tb1ZrMsM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0jIvCI5ZimTBEU/GhRoPT0toHTOT0LD6P4QhG
 8Qx5aT7PROJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatIyLwAKCRAFnS7L/zaE
 w7OqD/9XPomw5wkjrRrI8i8vh+xX5hip4UDZeNhWWz2wXMu3FhN+P44dow87Q6vmd/inA+FJxBo
 xihK1Lth/rwAKUSg3K0oBPmzlcQSsPMcse3Rr1e3BCuH0v+s9CD9HgkMzcGe2VrsUBwtTKGkAqP
 NQPPqCZA1xIGJHol4ZnvUbLCsJmlJTziUrjrt/LkYPHZFGSZ/LnmPB3sohfrWDMg1u9fd7o5mKe
 yoTBGdTmC1PgOVTAnFz5RoyEasMMLlDxMfEz06b3tnk4Hq0jU2TweNSqq/PX+6XwZj2RodZ2sLq
 guE8B73+PVCPD37OyOXSLgeWBUPktiELEQSWdW/mDOUIaNMsdjXDKZqKhxfU+NGqrQVkTjBdlv/
 wDnr9/TUnUEAHMEYbMPkgtNzvAzqT3a98bYxAwcrGxqQVWLf4c+ktuFWIDV2ZVS6bl518IQEKid
 WoQwZ8ZcF/lv5d9FkhYQFINYY6EhmAB3/VeYJteEh18uuquNLsJQXgDWQdXgTUY473k2YoNRaA+
 HpzU0EdPoRR1gQ5aIQDhySQ+CCQWTZhvpvkv8LzrFrlfJsFsW940M+M0pzmVyvOmzHQw00875UN
 sT4d9K4wLr1mCnNIuH2MDgFmIC5+I6296/ZIRocnt3VSoCCfcZx7svCfJoZMEu+j8hQ0Xu6ZfQr
 nQR2U0GgLfgrNZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX8wM3zm/A0TJw
 DpUFfsB2v9j3Z3tuXDB1Z13lW9+9vTLRykFMYQI1NAvK3Z1vh5YRR6hE1qRiX5hI9XlmfJ3VBXL
 OPyrzZG/uW4PYutCDSk1QfIFwy8QMT8=
X-Proofpoint-ORIG-GUID: XrJc08rJqNpo5G5xizSXVeLFCxhoViN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX6BbDl6I/vGKb
 cL6GyHOWlq3CxU3zKFNiMCNXrg000aaFUh37O7kly6VMxs6qWlG2kNFDPkVWhkzWaofTK6Dx9/9
 9B5Hjbb9IG7b7EexAWvLoGkhaAVKFZkgMEdMH7Yr3XBrTBwsPP2Vb/QJ/qwA4ymePRlXPhNoaeH
 +aStaVpTEoKs3kWQqXFf1yXJVyB11iy/uaMFxVLnbG7XIvNJPngKgFMePCQNu5m+a8m/jTTrytb
 fpBRfqWc65JMr3PRxw7ytddD/Q9Xf4nK7XtUW6JNfDBd0D7qTL/f5Fl3HdQQ28eBoqOzGsdsiAJ
 /S/5eQcddo3oDIoOhO1+40PQp7q3Ypwpf3Lnf180GztkmoiXovtMjhRd84Us+ucw87d72x/GePA
 p7C6cMWzP26bzMNvJ8bsFA1hkq5MZ4a1ZL1e8oeKBWq7UPF9rwwGdl574NnVon/JeztiaBg/HK9
 sgMER2gXd3sM0v3D8nA==
X-Proofpoint-GUID: XrJc08rJqNpo5G5xizSXVeLFCxhoViN9
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad2323b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Jdx4ahQE1gFdeJXEDfUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

Provide gpioctl, a new command-line tool for persistent GPIO line control.
Unlike gpioget and gpioset which release lines on exit, gpioctl holds
requested lines in a background daemon so their state survives across
multiple client invocations.

The client auto-spawns the daemon on first use. Communication uses a
per-user abstract Unix-domain socket, providing automatic cleanup and
per-user isolation without filesystem artifacts.

Each set of lines requested through the tool is assigned a unique ID and
referred to as a "request". The following sub-commands are provided:

  request      - Request a set of GPIO lines by offset or name. The daemon
                 holds them after the client exits.
  release      - Release a previously made request by ID.
  requests     - List all requests currently held by the daemon.
  get          - Read values of requested lines.
  set          - Set the output values of requested lines.
  monitor      - Subscribe to edge events on a held request.
  reconfigure  - Change the settings of a held request in-place without
                 releasing it (e.g. switch direction, add edge detection).

There are also "hidden" sub-commands that are not documented in the help
text but can be used for debugging purposes:

  ping         - Verify the daemon is running (spawns it if not).
  stop         - Ask the daemon to exit, releasing all held lines.
  debug        - Run the daemon in the foreground with logging enabled.

The wire protocol is intentionally private and unstable: only gpioctl
itself speaks it, so no ABI commitment is made.

Also add test-cases covering all sub-commands and configuration options.
Update documentation, man page generation (main page plus one page per
sub-command), and mark the persistent-daemon TODO item as complete.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 TODO                        |   14 -
 docs/.gitignore             |    2 +
 docs/conf.py                |    8 +
 docs/gpio_tools.rst         |   10 +-
 docs/gpioctl_top.rst        |  156 +++
 man/meson.build             |   39 +
 tools/gpio-tools-test.bash  | 1756 ++++++++++++++++++++++++++
 tools/gpioctl-test-helper.c |   58 +
 tools/gpioctl.c             | 2838 +++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build           |   21 +-
 tools/tools-common.c        |    2 +-
 11 files changed, 4887 insertions(+), 17 deletions(-)

diff --git a/TODO b/TODO
index 95bb3e5dfc3c7f5a8d46ae9b144b5a43866abd7b..c9c127ad785c3786648b7058da4df938beb19f1a 100644
--- a/TODO
+++ b/TODO
@@ -8,20 +8,6 @@ serve as the starting point.
 
 ==========
 
-* implement a simple daemon for controlling GPIOs in C together with a client
-  program
-
-This is by far the lowest priority task. Similarly as with the dbus daemon:
-the goal is to provide a centralized agent controlling GPIOs with a simple
-interface consisting of a command line client communicating with the server
-over unix sockets.
-
-In this case however the goal is to have as few dependencies as possible. This
-is because for some small systems dbus is overkill. Since we won't be using any
-standardized protocol, it will take much more effort to implement it correctly.
-
-----------
-
 * improve gpioset --interactive tab completion
 
 The existing tab completion uses libedit's readline emulation layer which
diff --git a/docs/.gitignore b/docs/.gitignore
index 61dac9a54aa0fef3ef44b993470ccd789ca630f2..2046e4c1b2c0552fa3ad2762ac47d2f762948233 100644
--- a/docs/.gitignore
+++ b/docs/.gitignore
@@ -11,6 +11,8 @@ gpioget.rst
 gpioset.rst
 gpiomon.rst
 gpionotify.rst
+gpioctl.rst
+gpioctl-*.rst
 
 gpio-manager.rst
 
diff --git a/docs/conf.py b/docs/conf.py
index 831d5f01235081e70c552c9a30e2f4711abd1bfb..48f0bae506018ab2f0e1386e2dee933c6cffc66e 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -136,6 +136,14 @@ for page in [
     "gpioset",
     "gpiomon",
     "gpionotify",
+    "gpioctl",
+    "gpioctl-get",
+    "gpioctl-monitor",
+    "gpioctl-reconfigure",
+    "gpioctl-release",
+    "gpioctl-request",
+    "gpioctl-requests",
+    "gpioctl-set",
     "gpio-manager",
     "gpiocli",
     "gpiocli-detect",
diff --git a/docs/gpio_tools.rst b/docs/gpio_tools.rst
index 2876970e4028451b05f7b20a551fc97d0a1685c2..08b09b17c3324bfacf29cc41c1b348d63623928f 100644
--- a/docs/gpio_tools.rst
+++ b/docs/gpio_tools.rst
@@ -16,7 +16,8 @@ Overview
 The **libgpiod** project includes a suite of **command-line tools** to
 facilitate GPIO manipulation from console and shell scripts.
 
-There are currently six command-line tools available:
+There are currently six stateless command-line tools available, plus
+``gpioctl`` for persistent line control:
 
 * **gpiodetect**: list all gpiochips present on the system, their names, labels
   and number of GPIO lines
@@ -32,6 +33,8 @@ There are currently six command-line tools available:
 * **gpionotify**: wait for changed to the info for GPIO lines, specify which
   changes to watch for, how many events to process before exiting, or if the
   events should be reported to the console
+* **gpioctl**: request and persistently hold GPIO lines via a per-user background
+  daemon; supports get, set, monitor and reconfigure operations on held requests
 
 Shared library
 --------------
@@ -60,6 +63,11 @@ of libgpiotools.
    gpiomon<gpiomon>
    gpionotify<gpionotify>
 
+.. toctree::
+   :maxdepth: 1
+
+   gpioctl<gpioctl_top>
+
 Examples
 --------
 
diff --git a/docs/gpioctl_top.rst b/docs/gpioctl_top.rst
new file mode 100644
index 0000000000000000000000000000000000000000..a756de5aadb0c33bc782f81a2da17901827749cc
--- /dev/null
+++ b/docs/gpioctl_top.rst
@@ -0,0 +1,156 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2026 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
+
+..
+   This file is part of libgpiod.
+
+   gpioctl command-line tool documentation
+
+Persistent GPIO control tool
+=============================
+
+``gpioctl`` provides GPIO control with **persistence**: a per-user background
+daemon holds requested lines even after the client process exits, unlike
+``gpioget`` or ``gpioset`` which release their lines on exit.
+
+The client auto-spawns the daemon on first use and communicates with it over
+a per-user abstract Unix-domain socket. The daemon exits automatically after
+60 seconds of inactivity.
+
+Examples
+--------
+
+Request a line as output and set it active:
+
+.. code-block:: none
+
+   $ gpioctl -c gpiochip0 request --output 5=active
+
+The client exits immediately; the daemon holds the line. Confirm with
+``gpioinfo``:
+
+.. code-block:: none
+
+   $ gpioinfo --chip gpiochip0 5
+   gpiochip0 5  unnamed  output consumer="gpioctl"
+
+List all requests currently held by the daemon:
+
+.. code-block:: none
+
+   $ gpioctl requests
+   request0 (gpiochip0) consumer="gpioctl" offsets: [5]
+
+List requests without quoting the consumer name:
+
+.. code-block:: none
+
+   $ gpioctl --unquoted requests
+   request0 (gpiochip0) consumer=gpioctl offsets: [5]
+
+Read the current value of a held request:
+
+.. code-block:: none
+
+   $ gpioctl get request0
+   active
+
+Read a line value by its name (daemon finds the request holding that line):
+
+.. code-block:: none
+
+   $ gpioctl get power_button
+   "power_button"=inactive
+
+Read multiple lines by name in a single call:
+
+.. code-block:: none
+
+   $ gpioctl get power_button power_led
+   "power_button"=inactive "power_led"=active
+
+Read the same lines without quoting the names:
+
+.. code-block:: none
+
+   $ gpioctl --unquoted get power_button power_led
+   power_button=inactive power_led=active
+
+Read a request's values as bare numbers instead of names:
+
+.. code-block:: none
+
+   $ gpioctl --numeric get request0
+   1
+
+Change the output value by request:
+
+.. code-block:: none
+
+   $ gpioctl set request0 inactive
+
+Change an output line by its name:
+
+.. code-block:: none
+
+   $ gpioctl set power_led=active
+
+Change multiple output lines by name in a single call:
+
+.. code-block:: none
+
+   $ gpioctl set power_led=active status_led=inactive
+
+Reconfigure a held request - switch to input and enable edge detection:
+
+.. code-block:: none
+
+   $ gpioctl reconfigure request0 --both-edges
+
+Monitor edge events on a held edge-detection request:
+
+.. code-block:: none
+
+   $ gpioctl monitor request0
+   1718000123.000456789 rising 5
+   1718000124.001234567 falling 5
+
+Monitor a request, printing its current line value before the first event:
+
+.. code-block:: none
+
+   $ gpioctl monitor --initial-state request0
+   active
+   1718000123.000456789 rising 5
+   1718000124.001234567 falling 5
+
+Release a single request:
+
+.. code-block:: none
+
+   $ gpioctl release request0
+
+Stop the daemon (releases all held lines):
+
+.. code-block:: none
+
+   $ gpioctl stop
+
+.. note::
+   For more information please refer to the output of ``gpioctl --help`` as
+   well as ``gpioctl <command> --help`` which prints detailed info on every
+   available command.
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Manual entries
+
+   gpioctl<gpioctl>
+   gpioctl-request<gpioctl-request>
+   gpioctl-release<gpioctl-release>
+   gpioctl-requests<gpioctl-requests>
+   gpioctl-get<gpioctl-get>
+   gpioctl-set<gpioctl-set>
+   gpioctl-monitor<gpioctl-monitor>
+   gpioctl-reconfigure<gpioctl-reconfigure>
diff --git a/man/meson.build b/man/meson.build
index f3a2d4e83698e3f9ca1a8ae35cdf3642dca90f23..a7a0ec3da1105e04be1339615139bfc5293c9b87 100644
--- a/man/meson.build
+++ b/man/meson.build
@@ -22,6 +22,45 @@ if tools_enabled
       install_dir: man1_dir,
     )
   endforeach
+
+  custom_target('gpioctl.1',
+    output: 'gpioctl.1',
+    command: [
+      help2man,
+      tools_exes['gpioctl'],
+      '--include', man_template,
+      '--no-info',
+      '--name=libgpiod command-line utility',
+      '--help-option=--help',
+      '--manual=gpioctl',
+      '--output=@OUTPUT@',
+    ],
+    install: true,
+    install_dir: man1_dir,
+  )
+
+  gpioctl_cmds = [
+    'get', 'monitor', 'reconfigure',
+    'release', 'request', 'requests', 'set',
+  ]
+
+  foreach cmd : gpioctl_cmds
+    custom_target('gpioctl-' + cmd + '.1',
+      output: 'gpioctl-' + cmd + '.1',
+      command: [
+        help2man,
+        tools_exes['gpioctl'],
+        '--include', man_template,
+        '--no-info',
+        '--name=libgpiod command-line utility',
+        '--help-option=' + cmd + ' --help',
+        '--manual=gpioctl-' + cmd,
+        '--output=@OUTPUT@',
+      ],
+      install: true,
+      install_dir: man1_dir,
+    )
+  endforeach
 endif
 
 if dbus_enabled
diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index f2b5ec7a69d46264dd10645d2af7275758866e0a..aacb344ea83da5763e37439cd9a40b3c9f7b55cd 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -2821,6 +2821,1762 @@ test_gpionotify_with_custom_format_unknown_specifier() {
 	output_is "%x"
 }
 
+#
+# gpioctl test cases
+#
+
+test_gpioctl_request_by_offset() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request 2
+	status_is 0
+
+	# the line is held by the daemon even though the client has exited
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_prints_id() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request 2
+	status_is 0
+	output_is "request0"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_id_increments() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request 2
+	status_is 0
+	output_is "request0"
+
+	run_prog gpioctl -c "$sim0" request 3
+	status_is 0
+	output_is "request1"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_by_name() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl request foo
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+\"foo\"\\s+input consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_by_name_with_chip() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request foo
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+\"foo\"\\s+input consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_with_consumer() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" --consumer gpio-tools-tests request foo
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+\"foo\"\\s+input consumer=\"gpio-tools-tests\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_multiple_lines() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" -C multi request 0 1 2 3
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input consumer=\"multi\""
+	output_regex_match "\\s+line\\s+1:\\s+unnamed\\s+input consumer=\"multi\""
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+input consumer=\"multi\""
+	output_regex_match "\\s+line\\s+3:\\s+unnamed\\s+input consumer=\"multi\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_multiple_lines_by_name() {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=3:bar line_name=5:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" -C multi request bar foo xyz
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" foo bar xyz
+	output_regex_match "$sim0 1\\s+\"foo\"\\s+input consumer=\"multi\""
+	output_regex_match "$sim0 3\\s+\"bar\"\\s+input consumer=\"multi\""
+	output_regex_match "$sim0 5\\s+\"xyz\"\\s+input consumer=\"multi\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_by_name_flag() {
+	# a numeric-looking name is resolved as a name with --by-name
+	gpiosim_chip sim0 num_lines=8 line_name=4:5
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" --by-name request 5
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 4
+	output_regex_match "$sim0 4\\s+\"5\"\\s+input consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_nonexistent_line() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request nosuchline
+	status_is 1
+	output_regex_match ".*cannot find line 'nosuchline'"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_multiple_chips() {
+	gpiosim_chip sim0 num_lines=8 line_name=0:foo
+	gpiosim_chip sim1 num_lines=8 line_name=0:bar
+
+	# resolving lines from more than one chip at a time is rejected
+	run_prog gpioctl request foo bar
+	status_is 1
+	output_regex_match ".*can only manipulate lines from one chip at a time"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_input_direction() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --input 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_output_direction() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+output consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_output_with_values() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 0=active 1=inactive 2=active
+	status_is 0
+
+	gpiosim_check_value sim0 0 1
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_output_with_numeric_values() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 0=0 1=1 2=0
+	status_is 0
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 2 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_output_active_low_with_values() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# active-low inverts the physical signal: active=1 drives the line low
+	run_prog gpioctl -c "$sim0" request --output --active-low 0=active 1=inactive
+	status_is 0
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 1
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_active_low() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --active-low 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input active-low consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_bias_pull_up() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --pull-up 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input bias=pull-up consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_bias_pull_down() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --pull-down 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input bias=pull-down consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_bias_disabled() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --bias-disabled 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input bias=disabled consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_drive_open_drain() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output --open-drain 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+output drive=open-drain consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_drive_open_source() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output --open-source 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+output drive=open-source consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_drive_push_pull() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output --push-pull 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+output consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_rising_edge() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --rising-edge 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input edges=rising consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_falling_edge() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --falling-edge 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input edges=falling consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_both_edges() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --both-edges 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input edges=both consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_debounce_period() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --both-edges --debounce-period=10ms 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match \
+"$sim0 2\\s+unnamed\\s+input edges=both debounce-period=10ms consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_bias_settings_mutually_exclusive() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local msg=".*--pull-up, --pull-down and --bias-disabled are mutually exclusive"
+
+	run_prog gpioctl -c "$sim0" request --pull-up --pull-down 2
+	status_is 1
+	output_regex_match "$msg"
+
+	run_prog gpioctl -c "$sim0" request --pull-up --bias-disabled 2
+	status_is 1
+	output_regex_match "$msg"
+
+	run_prog gpioctl -c "$sim0" request --pull-down --bias-disabled 2
+	status_is 1
+	output_regex_match "$msg"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_drive_settings_mutually_exclusive() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local msg=".*--push-pull, --open-drain and --open-source are mutually exclusive"
+
+	run_prog gpioctl -c "$sim0" request --output --open-drain --open-source 2
+	status_is 1
+	output_regex_match "$msg"
+
+	run_prog gpioctl -c "$sim0" request --output --push-pull --open-drain 2
+	status_is 1
+	output_regex_match "$msg"
+
+	run_prog gpioctl -c "$sim0" request --output --push-pull --open-source 2
+	status_is 1
+	output_regex_match "$msg"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_input_and_output_mutually_exclusive() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --input --output 2
+	status_is 1
+	output_regex_match ".*--input and --output are mutually exclusive"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_drive_requires_output() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --open-drain 2
+	status_is 1
+	output_regex_match ".*--push-pull, --open-drain and --open-source are only available in output mode"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_edge_and_output_mutually_exclusive() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output --rising-edge 2
+	status_is 1
+	output_regex_match ".*edge detection is only available in input mode"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_values_without_output_mode() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request 2=1
+	status_is 1
+	output_regex_match ".*output values can only be set in output mode"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_value_with_input_mode() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --input foo=active
+	status_is 1
+	output_regex_match ".*output values can only be set in output mode"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_partial_values_rejected() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# values must be set for all lines or none
+	run_prog gpioctl -c "$sim0" request --output 0=1 1
+	status_is 1
+	output_regex_match ".*if values are set, they must be set for all lines"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_debounce_requires_edge() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --debounce-period=10ms 2
+	status_is 1
+	output_regex_match ".*--debounce-period requires edge detection"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_clock_requires_edge() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --clock-realtime 2
+	status_is 1
+	output_regex_match ".*--clock-\* options require edge detection"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_request_clocks_mutually_exclusive() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --rising-edge --clock-realtime \
+		--clock-monotonic 2
+	status_is 1
+	output_regex_match \
+".*--clock-monotonic, --clock-realtime and --clock-hte are mutually exclusive"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_release_frees_line() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request foo
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+\"foo\"\\s+input consumer=\"gpioctl\""
+
+	run_prog gpioctl release request0
+	status_is 0
+
+	run_prog gpioctl requests
+	output_is ""
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+\"foo\"\\s+input$"
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_release_by_bare_id() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request 0
+	status_is 0
+
+	# the bare id is accepted in addition to the 'requestN' name
+	run_prog gpioctl release 0
+	status_is 0
+
+	run_prog gpioctl requests
+	output_is ""
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_release_reuses_id() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request 0
+	status_is 0
+	run_prog gpioctl -c "$sim0" request 1
+	status_is 0
+
+	# free the lower id, the next request must reclaim it from the pool
+	run_prog gpioctl release request0
+	status_is 0
+
+	run_prog gpioctl -c "$sim0" -C reuse request 2
+	status_is 0
+
+	run_prog gpioctl requests
+	output_regex_match "request0 \\($sim0\\) consumer=\"reuse\" offsets: \\[2\\]"
+	output_regex_match "request1 \\($sim0\\) consumer=\"gpioctl\" offsets: \\[1\\]"
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_release_nonexistent() {
+	# releasing an id the daemon doesn't hold is an error
+	run_prog gpioctl release request5
+	status_is 1
+	output_regex_match ".*unable to release request 5:.*"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_release_invalid_name() {
+	# a malformed request name is rejected by the client
+	run_prog gpioctl release foobar
+	status_is 1
+	output_regex_match ".*invalid request name: 'foobar'"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_input_value() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 2 pull-up
+
+	run_prog gpioctl -c "$sim0" request --input 2
+	status_is 0
+
+	run_prog gpioctl get request0
+	status_is 0
+	output_is "active"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_output_value() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 3=inactive
+	status_is 0
+
+	run_prog gpioctl get request0
+	status_is 0
+	output_is "inactive"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_multiple_values() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 3 pull-down
+
+	run_prog gpioctl -c "$sim0" request --input 1 3
+	status_is 0
+
+	run_prog gpioctl get request0
+	status_is 0
+	output_is "active inactive"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_with_numeric_values() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 3 pull-down
+
+	run_prog gpioctl -c "$sim0" request --input 1 3
+	status_is 0
+
+	run_prog gpioctl --numeric get request0
+	status_is 0
+	output_is "1 0"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_nonexistent_request() {
+	run_prog gpioctl get request99
+	status_is 1
+	output_regex_match ".*unable to get line values for request 99:.*"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_bare_id() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	run_prog gpioctl -c "$sim0" request --input 4
+	status_is 0
+
+	run_prog gpioctl get 0
+	status_is 0
+	output_is "active"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_by_name_input() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 2 pull-up
+
+	run_prog gpioctl -c "$sim0" request --input 2
+	status_is 0
+
+	run_prog gpioctl get foo
+	status_is 0
+	output_is '"foo"=active'
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_by_name_output() {
+	gpiosim_chip sim0 num_lines=8 line_name=5:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 5=inactive
+	status_is 0
+
+	run_prog gpioctl get bar
+	status_is 0
+	output_is '"bar"=inactive'
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_by_name_nonexistent() {
+	run_prog gpioctl get nosuchline
+	status_is 1
+	output_regex_match ".*no held request contains a line named.*"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_by_name_multiple() {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+
+	run_prog gpioctl -c "$sim0" request --input 1 4
+	status_is 0
+
+	run_prog gpioctl get foo bar
+	status_is 0
+	output_is '"foo"=active "bar"=inactive'
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_by_name_with_numeric_values() {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+
+	run_prog gpioctl -c "$sim0" request --input 1 4
+	status_is 0
+
+	run_prog gpioctl --numeric get foo bar
+	status_is 0
+	output_is "1 0"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_output_value() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 5 pull-up
+
+	run_prog gpioctl -c "$sim0" request --output 5=inactive
+	status_is 0
+
+	gpiosim_check_value sim0 5 0
+
+	run_prog gpioctl set request0 active
+	status_is 0
+
+	gpiosim_check_value sim0 5 1
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_multiple_values() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 1=inactive 2=inactive
+	status_is 0
+
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 0
+
+	run_prog gpioctl set request0 active inactive
+	status_is 0
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 2 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_nonexistent_request() {
+	run_prog gpioctl set request99 active
+	status_is 1
+	output_regex_match ".*unable to set line values for request 99:.*"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_wrong_number_of_values() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 0=inactive 1=inactive
+	status_is 0
+
+	# two lines but only one value
+	run_prog gpioctl set request0 active
+	status_is 1
+	output_regex_match ".*unable to set line values for request 0:.*"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_verified_by_get() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 6=inactive
+	status_is 0
+
+	run_prog gpioctl get request0
+	output_is "inactive"
+
+	run_prog gpioctl set request0 active
+	status_is 0
+
+	run_prog gpioctl get request0
+	output_is "active"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_by_name() {
+	gpiosim_chip sim0 num_lines=8 line_name=3:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 3=inactive
+	status_is 0
+
+	gpiosim_check_value sim0 3 0
+
+	run_prog gpioctl set baz=active
+	status_is 0
+
+	gpiosim_check_value sim0 3 1
+
+	run_prog gpioctl get baz
+	status_is 0
+	output_is '"baz"=active'
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_by_name_multiple() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo line_name=5:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 2=inactive 5=inactive
+	status_is 0
+
+	gpiosim_check_value sim0 2 0
+	gpiosim_check_value sim0 5 0
+
+	run_prog gpioctl set foo=active bar=active
+	status_is 0
+
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 5 1
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_by_name_wrong_name() {
+	run_prog gpioctl set nosuchline=active
+	status_is 1
+	output_regex_match ".*no held request contains a line named.*"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_subset_by_offset() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 0=inactive 1=inactive 2=inactive 3=inactive
+	status_is 0
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 0
+	gpiosim_check_value sim0 3 0
+
+	run_prog gpioctl set request0 0=active 3=active
+	status_is 0
+
+	gpiosim_check_value sim0 0 1
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 0
+	gpiosim_check_value sim0 3 1
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_mixed_positional_and_offset_rejected() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 0=inactive 1=inactive
+	status_is 0
+
+	run_prog gpioctl set request0 active 1=inactive
+	status_is 1
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_by_name_multi_request() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo
+	gpiosim_chip sim1 num_lines=8 line_name=5:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim1 5 pull-down
+
+	run_prog gpioctl -c "$sim0" request --input 2
+	status_is 0
+
+	run_prog gpioctl -c "$sim1" request --input 5
+	status_is 0
+
+	run_prog gpioctl get foo bar
+	status_is 0
+	output_is '"foo"=active "bar"=inactive'
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_get_by_name_unquoted() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo line_name=5:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+
+	run_prog gpioctl -c "$sim0" request --input 2 5
+	status_is 0
+
+	run_prog gpioctl --unquoted get foo bar
+	status_is 0
+	output_is 'foo=active bar=inactive'
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_set_by_name_multi_request() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo
+	gpiosim_chip sim1 num_lines=8 line_name=5:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	run_prog gpioctl -c "$sim0" request --output 2=inactive
+	status_is 0
+
+	run_prog gpioctl -c "$sim1" request --output 5=inactive
+	status_is 0
+
+	gpiosim_check_value sim0 2 0
+	gpiosim_check_value sim1 5 0
+
+	run_prog gpioctl set foo=active bar=active
+	status_is 0
+
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim1 5 1
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_rising_edge() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 3 pull-down
+
+	run_prog gpioctl -c "$sim0" request --rising-edge 3
+	status_is 0
+
+	dut_run gpioctl monitor --banner request0
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 3 pull-down
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 3 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+3"
+	assert_fail dut_readable
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_falling_edge() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 3 pull-up
+
+	run_prog gpioctl -c "$sim0" request --falling-edge 3
+	status_is 0
+
+	dut_run gpioctl monitor --banner request0
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 3 pull-down
+	gpiosim_set_pull sim0 3 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+3"
+	assert_fail dut_readable
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_both_edges() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --both-edges 4
+	status_is 0
+
+	dut_run gpioctl monitor --banner request0
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+4"
+
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+4"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_num_events() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --both-edges 2
+	status_is 0
+
+	dut_run gpioctl monitor --banner --num-events=2 request0
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 2 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+2"
+
+	gpiosim_set_pull sim0 2 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+2"
+
+	# monitor exits after 2 events
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_by_line_name() {
+	gpiosim_chip sim0 num_lines=8 line_name=3:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 3 pull-down
+
+	run_prog gpioctl -c "$sim0" request --rising-edge 3
+	status_is 0
+
+	dut_run gpioctl monitor --banner foo
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 3 pull-down
+	gpiosim_set_pull sim0 3 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+3"
+	assert_fail dut_readable
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_by_line_name_filtered() {
+	gpiosim_chip sim0 num_lines=8 line_name=3:foo line_name=5:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --both-edges 3 5
+	status_is 0
+
+	# monitor only foo (offset 3); bar (offset 5) events must be suppressed
+	dut_run gpioctl monitor --banner foo
+	dut_regex_match "Monitoring request0.*"
+
+	# trigger bar first - should be silently dropped
+	gpiosim_set_pull sim0 5 pull-up
+
+	# trigger foo - should appear
+	gpiosim_set_pull sim0 3 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+3"
+	assert_fail dut_readable
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_initial_state_bare_id() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 3 pull-up
+
+	run_prog gpioctl -c "$sim0" request --both-edges 3
+	status_is 0
+
+	dut_run gpioctl monitor --banner --initial-state request0
+	dut_regex_match "active"
+
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 3 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+3"
+	assert_fail dut_readable
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_initial_state_by_name() {
+	gpiosim_chip sim0 num_lines=8 line_name=3:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 3 pull-down
+
+	run_prog gpioctl -c "$sim0" request --both-edges 3
+	status_is 0
+
+	dut_run gpioctl monitor --banner --initial-state foo
+	dut_regex_match '"foo"=inactive'
+
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 3 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+3"
+	assert_fail dut_readable
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_initial_state_numeric() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 3 pull-up
+
+	run_prog gpioctl -c "$sim0" request --both-edges 3
+	status_is 0
+
+	dut_run gpioctl --numeric monitor --banner --initial-state request0
+	dut_regex_match "^1$"
+
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 3 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+3"
+	assert_fail dut_readable
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_format_event_type_offset() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --rising-edge 3
+	status_is 0
+
+	dut_run gpioctl monitor --banner "--format=%e %o" request0
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 3 pull-down
+	gpiosim_set_pull sim0 3 pull-up
+	dut_read
+	output_is "1 3"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_format_edge_string() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --both-edges 4
+	status_is 0
+
+	dut_run gpioctl monitor --banner "--format=%E" request0
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_read
+	output_is "rising"
+
+	gpiosim_set_pull sim0 4 pull-down
+	dut_read
+	output_is "falling"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_format_seconds_timestamp() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --rising-edge 2
+	status_is 0
+
+	dut_run gpioctl monitor --banner "--format=%S" request0
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 2 pull-down
+	gpiosim_set_pull sim0 2 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_localtime() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --rising-edge 5
+	status_is 0
+
+	dut_run gpioctl monitor --banner --localtime request0
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 5 pull-up
+	dut_regex_match "[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]+\s+rising\s+5"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_utc() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --rising-edge 6
+	status_is 0
+
+	dut_run gpioctl monitor --banner --utc request0
+	dut_regex_match "Monitoring request0.*"
+
+	gpiosim_set_pull sim0 6 pull-down
+	gpiosim_set_pull sim0 6 pull-up
+	dut_regex_match "[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]+Z\s+rising\s+6"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_monitor_nonexistent_request() {
+	run_prog gpioctl monitor request99
+	status_is 1
+	output_regex_match ".*unable to monitor request 99:.*"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_stop_releases_lines() {
+	gpiosim_chip sim0 num_lines=8 line_name=2:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request foo
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+\"foo\"\\s+input consumer=\"gpioctl\""
+
+	# stopping the daemon releases all the lines it held
+	run_prog gpioctl stop
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+\"foo\"\\s+input$"
+	status_is 0
+}
+
+test_gpioctl_requests_empty() {
+	run_prog gpioctl requests
+	status_is 0
+	output_is ""
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_requests_lists_request() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" -C lister request 0 1 2 3
+	status_is 0
+
+	run_prog gpioctl requests
+	output_regex_match \
+"request0 \\($sim0\\) consumer=\"lister\" offsets: \\[0, 1, 2, 3\\]"
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_requests_multiple_requests() {
+	gpiosim_chip sim0 num_lines=8
+	gpiosim_chip sim1 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	# each request gets the lowest free id from the pool
+	run_prog gpioctl -c "$sim0" request 0
+	status_is 0
+
+	run_prog gpioctl -c "$sim1" request 1
+	status_is 0
+
+	run_prog gpioctl requests
+	output_regex_match "request0 \\($sim0\\) consumer=\"gpioctl\" offsets: \\[0\\]"
+	output_regex_match "request1 \\($sim1\\) consumer=\"gpioctl\" offsets: \\[1\\]"
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_requests_unquoted() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" -C lister request 0 1
+	status_is 0
+
+	run_prog gpioctl --unquoted requests
+	output_regex_match \
+"request0 \\($sim0\\) consumer=lister offsets: \\[0, 1\\]"
+	status_is 0
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_socket_path() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sockpath
+
+	sockpath=$(mktemp -u /tmp/gpioctl-test-XXXXXX)
+
+	run_prog gpioctl -p "$sockpath" -c "$sim0" request 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input consumer=\"gpioctl\""
+	status_is 0
+
+	run_prog gpioctl -p "$sockpath" stop
+	status_is 0
+
+	# verify file was cleaned up (filesystem socket)
+	assert_fail test -e "$sockpath"
+}
+
+test_gpioctl_socket_path_isolates_daemons() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sockA sockB
+
+	sockA=$(mktemp -u /tmp/gpioctl-test-XXXXXX)
+	sockB=$(mktemp -u /tmp/gpioctl-test-XXXXXX)
+
+	# two separate daemons on different sockets
+	run_prog gpioctl -p "$sockA" -c "$sim0" request 0
+	status_is 0
+
+	run_prog gpioctl -p "$sockB" -c "$sim0" request 1
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 0
+	output_regex_match "$sim0 0\\s+unnamed\\s+input consumer=\"gpioctl\""
+	run_prog gpioinfo --chip "$sim0" 1
+	output_regex_match "$sim0 1\\s+unnamed\\s+input consumer=\"gpioctl\""
+
+	run_prog gpioctl -p "$sockA" stop
+	status_is 0
+
+	# sockB daemon still alive, line 1 still held
+	run_prog gpioinfo --chip "$sim0" 1
+	output_regex_match "$sim0 1\\s+unnamed\\s+input consumer=\"gpioctl\""
+
+	run_prog gpioctl -p "$sockB" stop
+	status_is 0
+}
+
+test_gpioctl_reconfigure_input_to_output() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --input 2
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+input consumer=\"gpioctl\""
+
+	run_prog gpioctl reconfigure request0 --output 2=active
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 2
+	output_regex_match "$sim0 2\\s+unnamed\\s+output consumer=\"gpioctl\""
+	gpiosim_check_value sim0 2 1
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_reconfigure_output_to_input() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 3=active
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 3
+	output_regex_match "$sim0 3\\s+unnamed\\s+output consumer=\"gpioctl\""
+
+	run_prog gpioctl reconfigure request0 --input
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 3
+	output_regex_match "$sim0 3\\s+unnamed\\s+input consumer=\"gpioctl\""
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_reconfigure_add_bias() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --input 4
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 4
+	output_regex_match "$sim0 4\\s+unnamed\\s+input consumer=\"gpioctl\""
+
+	run_prog gpioctl reconfigure request0 --pull-up
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 4
+	output_regex_match "$sim0 4\\s+unnamed\\s+input bias=pull-up consumer=\"gpioctl\""
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_reconfigure_add_edge_detection() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --input 5
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 5
+	output_regex_match "$sim0 5\\s+unnamed\\s+input consumer=\"gpioctl\""
+
+	run_prog gpioctl reconfigure request0 --rising-edge
+	status_is 0
+
+	run_prog gpioinfo --chip "$sim0" 5
+	output_regex_match \
+		"$sim0 5\\s+unnamed\\s+input edges=rising consumer=\"gpioctl\""
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_reconfigure_output_value() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioctl -c "$sim0" request --output 6=inactive
+	status_is 0
+
+	gpiosim_check_value sim0 6 0
+
+	run_prog gpioctl reconfigure request0 --output 6=active
+	status_is 0
+
+	gpiosim_check_value sim0 6 1
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+test_gpioctl_reconfigure_nonexistent() {
+	run_prog gpioctl reconfigure request99 --input
+	status_is 1
+	output_regex_match ".*unable to reconfigure request 99:.*"
+
+	run_prog gpioctl stop
+	status_is 0
+}
+
+gpioctl_debug_setup() {
+	SOCKPATH=$(mktemp -u /tmp/gpioctl-test-XXXXXX)
+
+	gpioctl debug -p "$SOCKPATH" > /dev/null 2>&1 &
+	DEBUG_PID=$!
+
+	local i
+	for i in $(seq 10); do
+		gpioctl -p "$SOCKPATH" ping > /dev/null 2>&1 && return 0
+		sleep 0.1
+	done
+
+	return 1
+}
+
+gpioctl_debug_teardown() {
+	kill "$DEBUG_PID" 2>/dev/null
+	wait "$DEBUG_PID" 2>/dev/null
+	rm -f "$SOCKPATH"
+}
+
+test_gpioctl_server_disconnects_on_short_message() {
+	gpioctl_debug_setup
+
+	gpioctl-test-helper "$SOCKPATH" 1
+
+	run_prog gpioctl -p "$SOCKPATH" ping
+	status_is 0
+
+	gpioctl_debug_teardown
+}
+
+test_gpioctl_server_disconnects_on_long_message() {
+	gpioctl_debug_setup
+
+	gpioctl-test-helper "$SOCKPATH" 100000
+
+	run_prog gpioctl -p "$SOCKPATH" ping
+	status_is 0
+
+	gpioctl_debug_teardown
+}
+
+test_gpioctl_server_disconnects_on_unknown_type() {
+	gpioctl_debug_setup
+
+	# GPIOCTL_MSG_SIZE = sizeof(struct message) in tools/gpioctl.c.
+	# = 4 (type) + sizeof(struct request_info) which dominates the union:
+	#   4 (id) + 32 (chip_name) + 32 (consumer) + 256 (offsets[64]) +
+	#   4 (num_offsets) + 2048 (line_names[64][32]) = 2376 -> total 2380.
+	# Update this constant if the wire protocol changes.
+	local GPIOCTL_MSG_SIZE=2380
+
+	# All-zero message: type field = 0 = MSG_TYPE_OK, a server-to-client
+	# type that has no case in client_receive()'s switch, so the server
+	# drops the client via the default path.
+	gpioctl-test-helper "$SOCKPATH" "$GPIOCTL_MSG_SIZE"
+
+	run_prog gpioctl -p "$SOCKPATH" ping
+	status_is 0
+
+	gpioctl_debug_teardown
+}
+
 # shellcheck source=tests/scripts/gpiod-bash-test-helper.inc
 source gpiod-bash-test-helper.inc
 
diff --git a/tools/gpioctl-test-helper.c b/tools/gpioctl-test-helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..c65b85065352681363f45b7dea12149522f28575
--- /dev/null
+++ b/tools/gpioctl-test-helper.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2026 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
+// SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <unistd.h>
+
+#include "tools-common.h"
+
+/*
+ * Test helper: connect to an AF_UNIX SOCK_SEQPACKET socket and send a single
+ * message of exactly <num-bytes> zero bytes. Used by the gpio-tools test
+ * suite to forge malformed messages to the gpioctl server.
+ */
+
+int main(int argc, char **argv)
+{
+	struct sockaddr_un addr;
+	unsigned long num_bytes;
+	char *end, *buf;
+	int sock;
+
+	set_prog_name(argv[0]);
+
+	if (argc != 3)
+		die("usage: %s <socket-path> <num-bytes>", get_prog_name());
+
+	num_bytes = strtoul(argv[2], &end, 10);
+	if (errno || *end != '\0' || end == argv[2])
+		die("invalid byte count: %s", argv[2]);
+
+	buf = calloc(1, num_bytes ? num_bytes : 1);
+	if (!buf)
+		die_oom();
+
+	sock = socket(AF_UNIX, SOCK_SEQPACKET, 0);
+	if (sock < 0)
+		die_perror("socket");
+
+	memset(&addr, 0, sizeof(addr));
+	addr.sun_family = AF_UNIX;
+	strncpy(addr.sun_path, argv[1], sizeof(addr.sun_path) - 1);
+
+	if (connect(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0)
+		die_perror("connect");
+
+	if (send(sock, buf, num_bytes, 0) < 0)
+		die_perror("send");
+
+	close(sock);
+	free(buf);
+
+	return EXIT_SUCCESS;
+}
diff --git a/tools/gpioctl.c b/tools/gpioctl.c
new file mode 100644
index 0000000000000000000000000000000000000000..6ae6812cb42c87400d5a7e0b5329c2f92fbc56ca
--- /dev/null
+++ b/tools/gpioctl.c
@@ -0,0 +1,2838 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+// SPDX-FileCopyrightText: 2026 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
+// SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <gpiod.h>
+#include <limits.h>
+#include <poll.h>
+#include <pwd.h>
+#include <signal.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/epoll.h>
+#include <sys/prctl.h>
+#include <sys/signalfd.h>
+#include <sys/socket.h>
+#include <sys/timerfd.h>
+#include <sys/types.h>
+#include <sys/un.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "tools-common.h"
+
+#define PACKED	__attribute__((__packed__))
+#define UNUSED	__attribute__((unused))
+
+enum {
+	MSG_TYPE_OK,
+	MSG_TYPE_ERROR,
+	MSG_TYPE_PING,
+	MSG_TYPE_STOP,
+	MSG_TYPE_REQUEST,
+	MSG_TYPE_REQ_OK,
+	MSG_TYPE_RELEASE,
+	MSG_TYPE_REQ_LIST,
+	MSG_TYPE_REQ_INFO,
+	MSG_TYPE_GET,
+	MSG_TYPE_GET_OK,
+	MSG_TYPE_SET,
+	MSG_TYPE_MONITOR,
+	MSG_TYPE_EDGE_EVENT,
+	MSG_TYPE_RECONFIGURE,
+	NUM_MSG_TYPES,
+};
+
+static const char *const msg_type_str[] = {
+	[MSG_TYPE_OK] = "Operation Successful",
+	[MSG_TYPE_ERROR] = "Operation Failed",
+	[MSG_TYPE_PING] = "Ping Server",
+	[MSG_TYPE_STOP] = "Stop Server",
+	[MSG_TYPE_REQUEST] = "Line Request",
+	[MSG_TYPE_REQ_OK] = "Line Request Successful",
+	[MSG_TYPE_RELEASE] = "Release",
+	[MSG_TYPE_REQ_LIST] = "List Requests",
+	[MSG_TYPE_REQ_INFO] = "Request Info",
+	[MSG_TYPE_GET] = "Get Values",
+	[MSG_TYPE_GET_OK] = "Get Values Response",
+	[MSG_TYPE_SET] = "Set Values",
+	[MSG_TYPE_MONITOR] = "Monitor",
+	[MSG_TYPE_EDGE_EVENT] = "Edge Event",
+	[MSG_TYPE_RECONFIGURE] = "Reconfigure Request",
+	NULL
+};
+
+#define MAX_EPOLL_EVENTS	16
+#define CONSUMER_NAME_SIZE	32
+#define MAX_REQ_LINES		64
+#define MONITOR_EVENT_BUF_SIZE	16
+
+struct list_head {
+	struct list_head *prev;
+	struct list_head *next;
+};
+
+#define container_of(ptr, type, member) \
+({ \
+	void *__mptr = (void *)(ptr); \
+	((type *)(__mptr - offsetof(type, member))); \
+})
+
+static void list_init(struct list_head *list)
+{
+	list->next = list;
+	list->prev = list;
+}
+
+static void list_add(struct list_head *new, struct list_head *head)
+{
+	struct list_head *prev = head->prev;
+
+	head->prev = new;
+	new->next = head;
+	new->prev = prev;
+	prev->next = new;
+}
+
+static void list_del(struct list_head *entry)
+{
+	struct list_head *prev = entry->prev, *next = entry->next;
+
+	prev->next = next;
+	next->prev = prev;
+}
+
+#define list_entry(ptr, type, member) container_of(ptr, type, member)
+
+#define list_first_entry(ptr, type, member) \
+	list_entry((ptr)->next, type, member)
+
+#define list_next_entry(pos, member) \
+	list_entry((pos)->member.next, typeof(*(pos)), member)
+
+#define list_entry_is_head(pos, head, member) (&pos->member == (head))
+
+#define list_for_each_entry(pos, head, member) \
+	for (pos = list_first_entry(head, typeof(*pos), member); \
+	     !list_entry_is_head(pos, head, member); \
+	     pos = list_next_entry(pos, member))
+
+#define list_for_each_entry_safe(pos, next, head, member) \
+	for (pos = list_first_entry(head, typeof(*pos), member), \
+	     next = list_next_entry(pos, member); \
+	     !list_entry_is_head(pos, head, member); \
+	     pos = next, next = list_next_entry(next, member))
+
+struct error {
+	unsigned int errnum;
+} PACKED;
+
+struct request_config {
+	unsigned int offsets[MAX_REQ_LINES];
+	unsigned int num_offsets;
+	enum gpiod_line_value values[MAX_REQ_LINES];
+	bool active_low;
+	enum gpiod_line_direction direction;
+	enum gpiod_line_bias bias;
+	enum gpiod_line_drive drive;
+	enum gpiod_line_edge edge;
+	enum gpiod_line_clock event_clock;
+	unsigned long debounce_period_us;
+} PACKED;
+
+struct request {
+	char chip_path[128];
+	char consumer[CONSUMER_NAME_SIZE];
+	struct request_config cfg;
+} PACKED;
+
+struct request_ok {
+	char req_name[CONSUMER_NAME_SIZE];
+} PACKED;
+
+struct release {
+	unsigned int id;
+} PACKED;
+
+struct request_info {
+	unsigned int id;
+	char chip_name[32];
+	char consumer[CONSUMER_NAME_SIZE];
+	unsigned int offsets[MAX_REQ_LINES];
+	unsigned int num_offsets;
+	char line_names[MAX_REQ_LINES][32];
+} PACKED;
+
+struct get_req {
+	unsigned int id;
+	unsigned int offsets[MAX_REQ_LINES];
+	unsigned int num_offsets;
+} PACKED;
+
+struct get_ok {
+	enum gpiod_line_value values[MAX_REQ_LINES];
+	unsigned int num_values;
+} PACKED;
+
+struct set_req {
+	unsigned int id;
+	unsigned int num_offsets;
+	unsigned int offsets[MAX_REQ_LINES];
+	unsigned int num_values;
+	enum gpiod_line_value values[MAX_REQ_LINES];
+} PACKED;
+
+struct monitor_req {
+	unsigned int id;
+} PACKED;
+
+struct reconfigure {
+	unsigned int id;
+	struct request_config cfg;
+} PACKED;
+
+struct edge_event {
+	uint64_t timestamp_ns;
+	unsigned int offset;
+	unsigned int event_type;
+} PACKED;
+
+/*
+ * The protocol is not stable, it is subject to change at any moment without
+ * any notice and meant only to be used by this program. Don't make it part
+ * of any library.
+ */
+struct message {
+	unsigned int type;
+	union {
+		struct error err;
+		struct request req;
+		struct request_ok req_ok;
+		struct release rel;
+		struct request_info req_info;
+		struct get_req get_req;
+		struct get_ok get_ok;
+		struct set_req set_req;
+		struct monitor_req monitor_req;
+		struct reconfigure reconfigure;
+		struct edge_event edge_ev;
+	};
+} PACKED;
+
+struct config {
+	bool by_name;
+	bool numeric;
+	bool strict;
+	bool unquoted;
+	const char *chip_id;
+	const char *consumer;
+	const char *socket_path;
+};
+
+struct server;
+
+struct receiver {
+	int fd;
+	void (*receive)(uint32_t, struct receiver *, struct server *);
+};
+
+struct client {
+	struct list_head list;
+	struct receiver rcv;
+	struct ucred creds;
+};
+
+static struct client *to_client(struct receiver *rcv)
+{
+	return container_of(rcv, struct client, rcv);
+}
+
+struct line_request {
+	struct list_head list;
+	struct gpiod_line_request *handle;
+	unsigned int id;
+	char consumer[CONSUMER_NAME_SIZE];
+	char line_names[MAX_REQ_LINES][32];
+	unsigned int num_lines;
+	struct client *monitor_client;
+	struct receiver monitor_rcv;
+	struct gpiod_edge_event_buffer *ev_buf;
+};
+
+struct server {
+	bool stop;
+	bool logging;
+	bool timer_armed;
+	struct receiver rcv;
+	int epollfd;
+	unsigned int usecnt;
+	struct receiver idle_timer;
+	struct receiver signal_handler;
+	struct list_head clients;
+	struct list_head requests;
+	char socket_path[sizeof(((struct sockaddr_un *)NULL)->sun_path)];
+};
+
+static void srv_vlog(struct server *srv, const char *fmt, va_list va)
+{
+	if (!srv->logging)
+		return;
+
+	vfprintf(stderr, fmt, va);
+}
+
+static PRINTF(2, 3) void srv_log(struct server *srv, const char *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	srv_vlog(srv, fmt, va);
+	va_end(va);
+}
+
+static NORETURN void srv_die(struct server *srv, const char *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	srv_vlog(srv, fmt, va);
+	va_end(va);
+	srv_log(srv, "\n");
+
+	exit(EXIT_FAILURE);
+}
+
+static PRINTF(2, 3) NORETURN void srv_die_perror(struct server *srv, const char *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	srv_vlog(srv, fmt, va);
+	srv_log(srv, ": %s\n", strerror(errno));
+	va_end(va);
+
+	exit(EXIT_FAILURE);
+}
+
+static NORETURN void srv_die_oom(struct server *srv)
+{
+	srv_die(srv, "Out of memory");
+}
+
+static int srv_add_receiver(struct server *srv, struct receiver *rcv, bool fatal)
+{
+	struct epoll_event event = {
+		.events = EPOLLIN | EPOLLPRI,
+		.data.ptr = rcv,
+	};
+	int ret;
+
+	ret = epoll_ctl(srv->epollfd, EPOLL_CTL_ADD, rcv->fd, &event);
+	if (ret) {
+		srv_log(srv, "Failed to add the receiver to the epoll set: %s\n",
+			strerror(errno));
+		if (fatal)
+			exit(EXIT_FAILURE);
+	}
+
+	return ret;
+}
+
+static void srv_remove_receiver(struct server *srv, struct receiver *rcv)
+{
+	epoll_ctl(srv->epollfd, EPOLL_CTL_DEL, rcv->fd, NULL);
+}
+
+static void arm_idle_timer(struct server *srv)
+{
+	struct receiver *timer = &srv->idle_timer;
+	struct itimerspec ts = { };
+	struct timespec now;
+	int ret;
+
+	ret = clock_gettime(CLOCK_MONOTONIC, &now);
+	if (ret)
+		srv_die_perror(srv, "failed to get current time");
+
+	ts.it_value.tv_sec = now.tv_sec + 60;
+	ts.it_value.tv_nsec = now.tv_nsec;
+
+	ret = timerfd_settime(timer->fd, TFD_TIMER_ABSTIME, &ts, NULL);
+	if (ret)
+		srv_die_perror(srv, "failed to arm the idle timer");
+
+	srv_add_receiver(srv, timer, true);
+
+	srv->timer_armed = true;
+	srv_log(srv, "Server is now idle, arming the idle timer\n");
+}
+
+static void disarm_idle_timer(struct server *srv)
+{
+	struct receiver *timer = &srv->idle_timer;
+	struct itimerspec ts = { };
+	int ret;
+
+	ret = timerfd_settime(timer->fd, 0, &ts, NULL);
+	if (ret)
+		srv_die_perror(srv, "failed to disarm the idle timer");
+
+	srv_remove_receiver(srv, timer);
+	srv->timer_armed = false;
+	srv_log(srv, "Server is now active, disarming the idle timer\n");
+}
+
+static void srv_inc_usecnt(struct server *srv)
+{
+	srv->usecnt++;
+	if (srv->usecnt == 1 && srv->timer_armed)
+		disarm_idle_timer(srv);
+}
+
+static void srv_dec_usecnt(struct server *srv)
+{
+	srv->usecnt--;
+	if (srv->usecnt == 0)
+		arm_idle_timer(srv);
+}
+
+static void srv_drop_client(struct server *srv, struct client *cli)
+{
+	struct line_request *line_req;
+
+	list_del(&cli->list);
+	srv_remove_receiver(srv, &cli->rcv);
+	close(cli->rcv.fd);
+
+	list_for_each_entry(line_req, &srv->requests, list) {
+		if (line_req->monitor_client == cli) {
+			srv_remove_receiver(srv, &line_req->monitor_rcv);
+			gpiod_edge_event_buffer_free(line_req->ev_buf);
+			line_req->ev_buf = NULL;
+			line_req->monitor_client = NULL;
+		}
+	}
+
+	srv_dec_usecnt(srv);
+	free(cli);
+}
+
+static const char *msg_type_to_str(unsigned int type)
+{
+	if (type >= NUM_MSG_TYPES)
+		return "Invalid";
+
+	return msg_type_str[type];
+}
+
+static int receive_message(struct receiver *rcv, struct server *srv,
+			   struct message *msg)
+{
+	ssize_t ret;
+
+	ret = recv(rcv->fd, msg, sizeof(*msg), MSG_TRUNC);
+	if (ret < 0) {
+		srv_log(srv, "Failed to receive client data: %s\n",
+			strerror(errno));
+		return -1;
+	}
+
+	if (ret == 0 || (size_t)ret != sizeof(*msg)) {
+		srv_log(srv, "Invalid message received from client\n");
+		return -1;
+	}
+
+	srv_log(srv, "Client message of type '%s' received\n",
+		msg_type_to_str(msg->type));
+
+	return 0;
+}
+
+static int send_message(struct receiver *rcv, struct server *srv,
+			struct message *msg)
+{
+	ssize_t ret;
+
+	ret = send(rcv->fd, msg, sizeof(*msg), 0);
+	if (ret < 0) {
+		srv_log(srv, "Failed to send data to client: %s\n",
+			strerror(errno));
+		return -1;
+	}
+
+	srv_log(srv, "Server message of type '%s' sent\n",
+		msg_type_to_str(msg->type));
+
+	return 0;
+}
+
+static void send_error_response(struct client *cli, struct server *srv,
+				int errnum)
+{
+	struct message msg = {
+		.type = MSG_TYPE_ERROR,
+		.err.errnum = errnum,
+	};
+
+	send_message(&cli->rcv, srv, &msg);
+}
+
+static bool check_num_offsets(struct client *cli, struct server *srv,
+			      unsigned int num_offsets)
+{
+	if (num_offsets > MAX_REQ_LINES) {
+		send_error_response(cli, srv, EINVAL);
+		return false;
+	}
+
+	return true;
+}
+
+static int build_line_config(struct gpiod_line_config *line_cfg,
+			     struct gpiod_line_settings *settings,
+			     const struct request_config *cfg)
+{
+	unsigned int offsets[MAX_REQ_LINES];
+
+	if (cfg->direction)
+		gpiod_line_settings_set_direction(settings, cfg->direction);
+	/* These imply input. */
+	else if (cfg->bias || cfg->edge || cfg->debounce_period_us)
+		gpiod_line_settings_set_direction(settings,
+						  GPIOD_LINE_DIRECTION_INPUT);
+
+	if (cfg->active_low)
+		gpiod_line_settings_set_active_low(settings, true);
+
+	if (cfg->bias)
+		gpiod_line_settings_set_bias(settings, cfg->bias);
+
+	if (cfg->drive)
+		gpiod_line_settings_set_drive(settings, cfg->drive);
+
+	if (cfg->edge)
+		gpiod_line_settings_set_edge_detection(settings, cfg->edge);
+
+	if (cfg->event_clock)
+		gpiod_line_settings_set_event_clock(settings, cfg->event_clock);
+
+	if (cfg->debounce_period_us)
+		gpiod_line_settings_set_debounce_period_us(settings,
+						cfg->debounce_period_us);
+
+	memcpy(offsets, cfg->offsets, cfg->num_offsets * sizeof(*offsets));
+
+	return gpiod_line_config_add_line_settings(line_cfg, offsets,
+						   cfg->num_offsets, settings);
+}
+
+static struct line_request *request_lines(struct server *srv,
+					  const struct request *req)
+{
+	enum gpiod_line_value values[MAX_REQ_LINES];
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_config *line_cfg;
+	struct line_request *line_req;
+	struct gpiod_line_info *info;
+	struct gpiod_chip *chip;
+	const char *name;
+	unsigned int i;
+	int ret;
+
+	line_req = malloc(sizeof(*line_req));
+	req_cfg = gpiod_request_config_new();
+	line_cfg = gpiod_line_config_new();
+	settings = gpiod_line_settings_new();
+	if (!line_req || !req_cfg || !line_cfg || !settings)
+		srv_die_oom(srv);
+
+	memset(line_req, 0, sizeof(*line_req));
+
+	ret = build_line_config(line_cfg, settings, &req->cfg);
+	if (ret)
+		goto err_out;
+
+	gpiod_request_config_set_consumer(req_cfg, req->consumer);
+
+	chip = gpiod_chip_open(req->chip_path);
+	if (!chip)
+		goto err_out;
+
+	line_req->handle = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	if (!line_req->handle) {
+		gpiod_chip_close(chip);
+		goto err_out;
+	}
+
+	for (i = 0; i < req->cfg.num_offsets; i++) {
+		info = gpiod_chip_get_line_info(chip, req->cfg.offsets[i]);
+		if (info) {
+			name = gpiod_line_info_get_name(info);
+			if (name)
+				snprintf(line_req->line_names[i],
+					 sizeof(line_req->line_names[i]),
+					 "%s", name);
+			gpiod_line_info_free(info);
+		}
+	}
+
+	gpiod_chip_close(chip);
+
+	line_req->num_lines = req->cfg.num_offsets;
+
+	if (req->cfg.direction == GPIOD_LINE_DIRECTION_OUTPUT &&
+	    req->cfg.values[0] != GPIOD_LINE_VALUE_ERROR) {
+		memcpy(values, req->cfg.values,
+		       req->cfg.num_offsets * sizeof(*values));
+		gpiod_line_request_set_values(line_req->handle, values);
+	}
+
+	gpiod_line_settings_free(settings);
+	gpiod_line_config_free(line_cfg);
+	gpiod_request_config_free(req_cfg);
+
+	return line_req;
+
+err_out:
+	gpiod_line_settings_free(settings);
+	gpiod_line_config_free(line_cfg);
+	gpiod_request_config_free(req_cfg);
+	free(line_req);
+	return NULL;
+}
+
+static bool request_id_taken(struct server *srv, unsigned int id)
+{
+	struct line_request *req;
+
+	list_for_each_entry(req, &srv->requests, list) {
+		if (req->id == id)
+			return true;
+	}
+
+	return false;
+}
+
+static unsigned int get_request_id(struct server *srv)
+{
+	unsigned int id;
+
+	for (id = 0; request_id_taken(srv, id); id++)
+		;
+
+	return id;
+}
+
+static void handle_line_request(struct client *cli, struct server *srv,
+				const struct request *req)
+{
+	struct message resp = { .type = MSG_TYPE_REQ_OK };
+	struct line_request *line_req;
+	int ret;
+
+	srv_log(srv, "Handling line request from process %d\n", cli->creds.pid);
+
+	line_req = request_lines(srv, req);
+	if (!line_req) {
+		srv_log(srv, "Line request failed (%s), sending back error response\n",
+			strerror(errno));
+		send_error_response(cli, srv, errno);
+		return;
+	}
+
+	line_req->id = get_request_id(srv);
+	snprintf(line_req->consumer, sizeof(line_req->consumer), "%s",
+		 req->consumer);
+	snprintf(resp.req_ok.req_name, CONSUMER_NAME_SIZE, "request%u",
+		 line_req->id);
+
+	ret = send_message(&cli->rcv, srv, &resp);
+	if (ret) {
+		srv_drop_client(srv, cli);
+		return;
+	}
+
+	list_add(&line_req->list, &srv->requests);
+	srv_inc_usecnt(srv);
+}
+
+static void handle_list_request(struct client *cli, struct server *srv)
+{
+	unsigned int offsets[MAX_REQ_LINES];
+	struct line_request *line_req;
+	const char *chip_name;
+	struct message resp;
+	size_t num_offsets;
+	int ret;
+
+	srv_log(srv, "Handling list request from process %d\n", cli->creds.pid);
+
+	list_for_each_entry(line_req, &srv->requests, list) {
+		memset(&resp, 0, sizeof(resp));
+		resp.type = MSG_TYPE_REQ_INFO;
+		resp.req_info.id = line_req->id;
+		snprintf(resp.req_info.consumer, sizeof(resp.req_info.consumer),
+			 "%s", line_req->consumer);
+
+		chip_name = gpiod_line_request_get_chip_name(line_req->handle);
+		snprintf(resp.req_info.chip_name, sizeof(resp.req_info.chip_name),
+			 "%s", chip_name);
+
+		num_offsets = gpiod_line_request_get_requested_offsets(
+				line_req->handle, offsets, MAX_REQ_LINES);
+		memcpy(resp.req_info.offsets, offsets,
+		       num_offsets * sizeof(*offsets));
+		resp.req_info.num_offsets = num_offsets;
+		memcpy(resp.req_info.line_names, line_req->line_names,
+		       num_offsets * sizeof(*line_req->line_names));
+
+		ret = send_message(&cli->rcv, srv, &resp);
+		if (ret) {
+			srv_drop_client(srv, cli);
+			return;
+		}
+	}
+
+	memset(&resp, 0, sizeof(resp));
+	resp.type = MSG_TYPE_OK;
+
+	ret = send_message(&cli->rcv, srv, &resp);
+	if (ret)
+		srv_drop_client(srv, cli);
+}
+
+static void handle_release_request(struct client *cli, struct server *srv,
+				   const struct release *rel)
+{
+	struct line_request *line_req, *tmp;
+	struct message resp;
+	int ret;
+
+	srv_log(srv, "Handling release request for id %u from process %d\n",
+		rel->id, cli->creds.pid);
+
+	list_for_each_entry_safe(line_req, tmp, &srv->requests, list) {
+		if (line_req->id != rel->id)
+			continue;
+
+		if (line_req->monitor_client) {
+			srv_remove_receiver(srv, &line_req->monitor_rcv);
+
+			memset(&resp, 0, sizeof(resp));
+			resp.type = MSG_TYPE_OK;
+			send_message(&line_req->monitor_client->rcv, srv, &resp);
+		}
+
+		list_del(&line_req->list);
+		gpiod_line_request_release(line_req->handle);
+		gpiod_edge_event_buffer_free(line_req->ev_buf);
+		free(line_req);
+		srv_dec_usecnt(srv);
+
+		memset(&resp, 0, sizeof(resp));
+		resp.type = MSG_TYPE_OK;
+
+		ret = send_message(&cli->rcv, srv, &resp);
+		if (ret)
+			srv_drop_client(srv, cli);
+
+		return;
+	}
+
+	srv_log(srv, "No request with id %u to release\n", rel->id);
+	send_error_response(cli, srv, ENOENT);
+}
+
+static struct line_request *find_request(struct server *srv, unsigned int id)
+{
+	struct line_request *line_req;
+
+	list_for_each_entry(line_req, &srv->requests, list) {
+		if (line_req->id == id)
+			return line_req;
+	}
+
+	return NULL;
+}
+
+static void handle_get_request(struct client *cli, struct server *srv,
+				const struct get_req *get)
+{
+	struct message resp = { .type = MSG_TYPE_GET_OK };
+	enum gpiod_line_value values[MAX_REQ_LINES];
+	unsigned int offsets[MAX_REQ_LINES];
+	struct line_request *line_req;
+	size_t num_lines;
+	int ret;
+
+	srv_log(srv, "Handling get request for id %u from process %d\n",
+		get->id, cli->creds.pid);
+
+	line_req = find_request(srv, get->id);
+	if (!line_req) {
+		send_error_response(cli, srv, ENOENT);
+		return;
+	}
+
+	if (get->num_offsets == 0) {
+		num_lines = gpiod_line_request_get_num_requested_lines(
+							line_req->handle);
+		ret = gpiod_line_request_get_values(line_req->handle, values);
+	} else {
+		num_lines = get->num_offsets;
+		memcpy(offsets, get->offsets, num_lines * sizeof(*offsets));
+		ret = gpiod_line_request_get_values_subset(line_req->handle,
+							   num_lines,
+							   offsets,
+							   values);
+	}
+	if (ret) {
+		send_error_response(cli, srv, errno);
+		return;
+	}
+
+	memcpy(resp.get_ok.values, values, num_lines * sizeof(*values));
+	resp.get_ok.num_values = num_lines;
+
+	ret = send_message(&cli->rcv, srv, &resp);
+	if (ret)
+		srv_drop_client(srv, cli);
+}
+
+static void handle_set_request(struct client *cli, struct server *srv,
+				const struct set_req *set)
+{
+	enum gpiod_line_value values[MAX_REQ_LINES], setvals[MAX_REQ_LINES];
+	struct message resp = { .type = MSG_TYPE_OK };
+	unsigned int offsets[MAX_REQ_LINES];
+	struct line_request *line_req;
+	size_t num_lines;
+	int ret;
+
+	srv_log(srv, "Handling set request for id %u from process %d\n",
+		set->id, cli->creds.pid);
+
+	line_req = find_request(srv, set->id);
+	if (!line_req) {
+		send_error_response(cli, srv, ENOENT);
+		return;
+	}
+
+	if (set->num_offsets == 0) {
+		num_lines = gpiod_line_request_get_num_requested_lines(
+							line_req->handle);
+		if (set->num_values != num_lines) {
+			send_error_response(cli, srv, EINVAL);
+			return;
+		}
+		memcpy(values, set->values, num_lines * sizeof(*values));
+		ret = gpiod_line_request_set_values(line_req->handle, values);
+	} else {
+		memcpy(offsets, set->offsets,
+		       set->num_offsets * sizeof(*offsets));
+		memcpy(setvals, set->values,
+		       set->num_offsets * sizeof(*setvals));
+		ret = gpiod_line_request_set_values_subset(line_req->handle,
+							   set->num_offsets,
+							   offsets,
+							   setvals);
+	}
+	if (ret) {
+		send_error_response(cli, srv, errno);
+		return;
+	}
+
+	ret = send_message(&cli->rcv, srv, &resp);
+	if (ret)
+		srv_drop_client(srv, cli);
+}
+
+static void handle_reconfigure_request(struct client *cli, struct server *srv,
+					const struct reconfigure *rcfg)
+{
+	struct message resp = { .type = MSG_TYPE_OK };
+	enum gpiod_line_value values[MAX_REQ_LINES];
+	struct gpiod_line_settings *settings;
+	unsigned int offsets[MAX_REQ_LINES];
+	struct gpiod_line_config *line_cfg;
+	struct line_request *line_req;
+	struct request_config cfg;
+	size_t num_lines;
+	int ret;
+
+	srv_log(srv, "Handling reconfigure request for id %u from process %d\n",
+		rcfg->id, cli->creds.pid);
+
+	line_req = find_request(srv, rcfg->id);
+	if (!line_req) {
+		send_error_response(cli, srv, ENOENT);
+		return;
+	}
+
+	cfg = rcfg->cfg;
+	num_lines = gpiod_line_request_get_requested_offsets(
+			line_req->handle, offsets, MAX_REQ_LINES);
+	memcpy(cfg.offsets, offsets, num_lines * sizeof(*offsets));
+	cfg.num_offsets = num_lines;
+
+	line_cfg = gpiod_line_config_new();
+	settings = gpiod_line_settings_new();
+	if (!line_cfg || !settings)
+		srv_die_oom(srv);
+
+	ret = build_line_config(line_cfg, settings, &cfg);
+	if (ret) {
+		gpiod_line_settings_free(settings);
+		gpiod_line_config_free(line_cfg);
+		send_error_response(cli, srv, errno);
+		return;
+	}
+
+	ret = gpiod_line_request_reconfigure_lines(line_req->handle, line_cfg);
+	gpiod_line_settings_free(settings);
+	gpiod_line_config_free(line_cfg);
+	if (ret) {
+		send_error_response(cli, srv, errno);
+		return;
+	}
+
+	if (rcfg->cfg.direction == GPIOD_LINE_DIRECTION_OUTPUT &&
+	    rcfg->cfg.values[0] != GPIOD_LINE_VALUE_ERROR) {
+		memcpy(values, rcfg->cfg.values, num_lines * sizeof(*values));
+		gpiod_line_request_set_values(line_req->handle, values);
+	}
+
+	ret = send_message(&cli->rcv, srv, &resp);
+	if (ret)
+		srv_drop_client(srv, cli);
+}
+
+static void monitor_receive(uint32_t events UNUSED, struct receiver *rcv,
+			    struct server *srv)
+{
+	struct line_request *line_req =
+			container_of(rcv, struct line_request, monitor_rcv);
+	struct gpiod_edge_event *event;
+	struct message msg;
+	int num_events, i, ret;
+
+	num_events = gpiod_line_request_read_edge_events(line_req->handle,
+							 line_req->ev_buf,
+							 MONITOR_EVENT_BUF_SIZE);
+	if (num_events < 0)
+		return;
+
+	for (i = 0; i < num_events; i++) {
+		event = gpiod_edge_event_buffer_get_event(line_req->ev_buf, i);
+
+		memset(&msg, 0, sizeof(msg));
+		msg.type = MSG_TYPE_EDGE_EVENT;
+		msg.edge_ev.timestamp_ns = gpiod_edge_event_get_timestamp_ns(event);
+		msg.edge_ev.offset = gpiod_edge_event_get_line_offset(event);
+		msg.edge_ev.event_type = gpiod_edge_event_get_event_type(event);
+
+		ret = send_message(&line_req->monitor_client->rcv, srv, &msg);
+		if (ret) {
+			srv_drop_client(srv, line_req->monitor_client);
+			break;
+		}
+	}
+}
+
+static void handle_monitor_request(struct client *cli, struct server *srv,
+				   const struct monitor_req *mon)
+{
+	struct message resp = { .type = MSG_TYPE_OK };
+	struct line_request *line_req;
+	int ret;
+
+	srv_log(srv, "Handling monitor request for id %u from process %d\n",
+		mon->id, cli->creds.pid);
+
+	line_req = find_request(srv, mon->id);
+	if (!line_req) {
+		send_error_response(cli, srv, ENOENT);
+		return;
+	}
+
+	if (line_req->monitor_client) {
+		send_error_response(cli, srv, EBUSY);
+		return;
+	}
+
+	line_req->ev_buf = gpiod_edge_event_buffer_new(MONITOR_EVENT_BUF_SIZE);
+	if (!line_req->ev_buf) {
+		send_error_response(cli, srv, ENOMEM);
+		return;
+	}
+
+	line_req->monitor_client = cli;
+	line_req->monitor_rcv.fd = gpiod_line_request_get_fd(line_req->handle);
+	line_req->monitor_rcv.receive = monitor_receive;
+
+	ret = srv_add_receiver(srv, &line_req->monitor_rcv, false);
+	if (ret) {
+		gpiod_edge_event_buffer_free(line_req->ev_buf);
+		line_req->ev_buf = NULL;
+		line_req->monitor_client = NULL;
+		send_error_response(cli, srv, errno);
+		return;
+	}
+
+	ret = send_message(&cli->rcv, srv, &resp);
+	if (ret)
+		srv_drop_client(srv, cli);
+}
+
+static void client_receive(uint32_t events, struct receiver *rcv,
+			   struct server *srv)
+{
+	struct client *cli = to_client(rcv);
+	struct message msg = { };
+	int ret;
+
+	if (events & EPOLLHUP) {
+		srv_log(srv, "Process %d hang up\n", cli->creds.pid);
+		srv_drop_client(srv, cli);
+		return;
+	}
+
+	ret = receive_message(rcv, srv, &msg);
+	if (ret) {
+		srv_drop_client(srv, cli);
+		return;
+	}
+
+	switch (msg.type) {
+	case MSG_TYPE_STOP:
+		srv_log(srv, "Stop request received from client, exiting\n");
+		msg.type = MSG_TYPE_OK;
+		ret = send_message(rcv, srv, &msg);
+		if (ret)
+			srv_drop_client(srv, cli);
+
+		srv->stop = true;
+		break;
+	case MSG_TYPE_REQUEST:
+		if (!check_num_offsets(cli, srv, msg.req.cfg.num_offsets))
+			break;
+		handle_line_request(cli, srv, &msg.req);
+		break;
+	case MSG_TYPE_RELEASE:
+		handle_release_request(cli, srv, &msg.rel);
+		break;
+	case MSG_TYPE_REQ_LIST:
+		handle_list_request(cli, srv);
+		break;
+	case MSG_TYPE_GET:
+		if (!check_num_offsets(cli, srv, msg.get_req.num_offsets))
+			break;
+		handle_get_request(cli, srv, &msg.get_req);
+		break;
+	case MSG_TYPE_SET:
+		if (!check_num_offsets(cli, srv, msg.set_req.num_offsets))
+			break;
+		handle_set_request(cli, srv, &msg.set_req);
+		break;
+	case MSG_TYPE_RECONFIGURE:
+		if (!check_num_offsets(cli, srv, msg.reconfigure.cfg.num_offsets))
+			break;
+		handle_reconfigure_request(cli, srv, &msg.reconfigure);
+		break;
+	case MSG_TYPE_MONITOR:
+		handle_monitor_request(cli, srv, &msg.monitor_req);
+		break;
+	case MSG_TYPE_PING:
+		srv_log(srv, "Ping request received from client\n");
+		msg.type = MSG_TYPE_OK;
+		ret = send_message(rcv, srv, &msg);
+		if (ret)
+			srv_drop_client(srv, cli);
+
+		break;
+	default:
+		srv_log(srv, "Unexpected message type %d received from client\n",
+			msg.type);
+		srv_drop_client(srv, cli);
+		return;
+	}
+}
+
+static void server_receive(uint32_t events UNUSED, struct receiver *rcv,
+			   struct server *srv)
+{
+	struct client *cli;
+	struct passwd *pwd;
+	socklen_t len;
+	int sock, ret;
+
+	sock = accept(rcv->fd, NULL, NULL);
+	if (sock < 0) {
+		srv_log(srv, "Failed to accept client connection: %s\n",
+			strerror(errno));
+		return;
+	}
+
+	cli = malloc(sizeof(*cli));
+	if (!cli)
+		srv_die_oom(srv);
+
+	len = sizeof(cli->creds);
+	ret = getsockopt(sock, SOL_SOCKET, SO_PEERCRED, &cli->creds, &len);
+	if (ret) {
+		close(sock);
+		free(cli);
+		return;
+	}
+
+	pwd = getpwuid(cli->creds.uid);
+	if (!pwd) {
+		srv_log(srv, "Failed to get credentials from connected client: %s\n",
+			strerror(errno));
+		close(sock);
+		free(cli);
+		return;
+	}
+
+	cli->rcv.fd = sock;
+	cli->rcv.receive = client_receive;
+
+	ret = srv_add_receiver(srv, &cli->rcv, false);
+	if (ret) {
+		close(sock);
+		free(cli);
+		return;
+	}
+
+	list_add(&cli->list, &srv->clients);
+
+	srv_log(srv, "Accepted connection from process %d (user: %s)\n",
+		cli->creds.pid, pwd->pw_name);
+
+	srv_inc_usecnt(srv);
+}
+
+static void signal_receive(uint32_t events UNUSED, struct receiver *rcv,
+			   struct server *srv)
+{
+	struct signalfd_siginfo siginfo;
+	ssize_t ret;
+
+	ret = read(rcv->fd, &siginfo, sizeof(siginfo));
+	if (ret < 0) {
+		srv_log(srv, "Failed to receive signal info\n");
+		return;
+	}
+
+	switch (siginfo.ssi_signo) {
+	case SIGINT:
+	case SIGTERM:
+	case SIGQUIT:
+		srv_log(srv, "Signal %d received\n", siginfo.ssi_signo);
+		srv->stop = true;
+		break;
+	default:
+		break;
+	}
+}
+
+static void add_signalfd(struct server *srv)
+{
+	int sigfd, ret;
+	sigset_t mask;
+
+	sigemptyset(&mask);
+	sigaddset(&mask, SIGINT);
+	sigaddset(&mask, SIGTERM);
+	sigaddset(&mask, SIGQUIT);
+
+	ret = sigprocmask(SIG_BLOCK, &mask, NULL);
+	if (ret)
+		srv_die_perror(srv, "failed to mask signals");
+
+	sigfd = signalfd(-1, &mask, 0);
+	if (sigfd < 0)
+		srv_die_perror(srv, "failed to create signalfd");
+
+	srv->signal_handler.fd = sigfd;
+	srv->signal_handler.receive = signal_receive;
+
+	srv_add_receiver(srv, &srv->signal_handler, true);
+}
+
+static void timer_receive(uint32_t events UNUSED, struct receiver *rcv,
+			  struct server *srv)
+{
+	uint64_t exp;
+	ssize_t ret;
+
+	ret = read(rcv->fd, &exp, sizeof(exp));
+	if (ret < 0)
+		die_perror("failed to read timer data");
+
+	srv_log(srv, "Idle timer expired\n");
+	srv->stop = true;
+}
+
+static void add_timerfd(struct server *srv)
+{
+	struct receiver *timer = &srv->idle_timer;
+
+	timer->fd = timerfd_create(CLOCK_MONOTONIC, 0);
+	if (timer->fd < 0)
+		die_perror("failed to create the timer file descriptor");
+
+	timer->receive = timer_receive;
+}
+
+static void free_server(struct server *srv)
+{
+	close(srv->epollfd);
+	if (srv->rcv.fd >= 0)
+		close(srv->rcv.fd);
+	/* Filesystem sockets (non-abstract) need to be unlinked. */
+	if (srv->socket_path[0] != '\0')
+		unlink(srv->socket_path);
+	free(srv);
+}
+
+static NORETURN void run_server(struct server *srv)
+{
+	struct epoll_event events[MAX_EPOLL_EVENTS], *event;
+	struct client *cli, *tmp;
+	struct receiver *rcv;
+	int numev, i;
+
+	add_signalfd(srv);
+	add_timerfd(srv);
+	arm_idle_timer(srv);
+
+	srv_log(srv, "gpioctl server started\n");
+
+	while (!srv->stop) {
+		numev = epoll_wait(srv->epollfd, events, MAX_EPOLL_EVENTS, 60 * 1000);
+		if (numev < 0) {
+			if (errno == EINTR)
+				continue;
+
+			srv_die_perror(srv, "Failed to poll file descriptors");
+		}
+
+		if (numev == 0)
+			continue;
+
+		for (i = 0; i < numev; i++) {
+			event = &events[i];
+			rcv = event->data.ptr;
+			rcv->receive(event->events, rcv, srv);
+		}
+	}
+
+	srv_log(srv, "gpioctl server exiting\n");
+
+	/*
+	 * Close the listening socket before dropping clients so that any
+	 * new connection attempt races get ECONNREFUSED rather than
+	 * connecting to a server that won't serve them.
+	 */
+	epoll_ctl(srv->epollfd, EPOLL_CTL_DEL, srv->rcv.fd, NULL);
+	close(srv->rcv.fd);
+	srv->rcv.fd = -1;
+	if (srv->socket_path[0] != '\0') {
+		unlink(srv->socket_path);
+		srv->socket_path[0] = '\0';
+	}
+
+	list_for_each_entry_safe(cli, tmp, &srv->clients, list)
+		srv_drop_client(srv, cli);
+	close(srv->signal_handler.fd);
+	close(srv->idle_timer.fd);
+	free_server(srv);
+
+	exit(EXIT_SUCCESS);
+}
+
+static struct server *make_server(const struct sockaddr_un *addr)
+{
+	struct epoll_event event = {
+		.events = EPOLLIN | EPOLLERR,
+	};
+	struct server *srv;
+	int ret, sock;
+
+	sock = socket(AF_UNIX, SOCK_SEQPACKET, 0);
+	if (sock < 0)
+		die_perror("failed to create the server socket");
+
+	ret = bind(sock, (struct sockaddr *)addr, sizeof(*addr));
+	if (ret)
+		die_perror("failed to bind to the unix socket");
+
+	ret = listen(sock, 128);
+	if (ret < 0)
+		die_perror("failed to start listening on the socket");
+
+	srv = malloc(sizeof(*srv));
+	if (!srv)
+		die_oom();
+
+	memset(srv, 0, sizeof(*srv));
+	memcpy(srv->socket_path, addr->sun_path, sizeof(srv->socket_path));
+
+	srv->epollfd = epoll_create1(0);
+	if (srv->epollfd < 0)
+		die_perror("failed to create the epoll handle");
+
+	list_init(&srv->clients);
+	list_init(&srv->requests);
+	srv->rcv.fd = sock;
+	srv->rcv.receive = server_receive;
+	event.data.ptr = &srv->rcv;
+
+	ret = epoll_ctl(srv->epollfd, EPOLL_CTL_ADD, sock, &event);
+	if (ret)
+		die_perror("failed to add the server socket to the epoll set");
+
+	return srv;
+}
+
+static void redirect_fds(void)
+{
+	int fd;
+
+	fd = open("/dev/null", O_RDONLY);
+	dup2(fd, STDIN_FILENO);
+	close(fd);
+
+	fd = open("/dev/null", O_WRONLY);
+	dup2(fd, STDOUT_FILENO);
+	dup2(fd, STDERR_FILENO);
+	close(fd);
+}
+
+static void spawn_server(struct server *srv)
+{
+	pid_t pid;
+
+	pid = fork();
+	if (pid < 0) {
+		die_perror("failed to spawn the server process");
+	} else if (pid == 0) {
+		/*
+		 * Server process. Start a new session and fork again to be
+		 * reparented to init.
+		 */
+		setsid();
+
+		pid = fork();
+		if (pid < 0)
+			die_perror("failed to spawn the final server process");
+		else if (pid > 0)
+			exit(EXIT_SUCCESS);
+
+		prctl(PR_SET_NAME, "gpioctl server");
+		redirect_fds();
+
+		run_server(srv);
+	} else {
+		/* Client process, wait for the first fork to exit. */
+		waitpid(pid, NULL, 0);
+	}
+}
+
+static void start_server(const struct sockaddr_un *addr)
+{
+	struct server *srv;
+
+	srv = make_server(addr);
+	spawn_server(srv);
+	/*
+	 * If we returned, we're the client. The daemon owns the socket file,
+	 * so clear the path so that free_server() doesn't unlink it from the
+	 * client.
+	 */
+	srv->socket_path[0] = '\0';
+	free_server(srv);
+}
+
+static int try_connect(const struct sockaddr_un *addr)
+{
+	int sock, ret;
+
+	sock = socket(AF_UNIX, SOCK_SEQPACKET, 0);
+	if (sock < 0)
+		die_perror("failed to create the client socket");
+
+	ret = connect(sock, (struct sockaddr *)addr, sizeof(*addr));
+	if (ret) {
+		if (errno == ENOENT || errno == ECONNREFUSED) {
+			/*
+			 * The socket file does not exist or is there but
+			 * there's no server bound to it behind.
+			 */
+			close(sock);
+			return -1;
+		}
+
+		die_perror("failed to connect to server");
+	}
+
+	return sock;
+}
+
+static void make_addr(struct sockaddr_un *addr, const char *socket_path)
+{
+	memset(addr, 0, sizeof(*addr));
+	addr->sun_family = AF_UNIX;
+	if (socket_path) {
+		strncpy(addr->sun_path, socket_path, sizeof(addr->sun_path) - 1);
+	} else {
+		snprintf(addr->sun_path + 1, sizeof(addr->sun_path) - 1,
+			 "gpioctl-%u", getuid());
+	}
+}
+
+static int get_connection(const char *socket_path)
+{
+	struct sockaddr_un addr;
+	int sock;
+
+	make_addr(&addr, socket_path);
+
+	sock = try_connect(&addr);
+	if (sock >= 0)
+		return sock;
+
+	start_server(&addr);
+
+	sock = try_connect(&addr);
+	if (sock < 0)
+		die_perror("failed to connect to server");
+
+	return sock;
+}
+
+static int debug_main(int argc UNUSED, char **argv UNUSED,
+		      const struct config *cfg)
+{
+	struct sockaddr_un addr;
+	struct server *srv;
+
+	make_addr(&addr, cfg->socket_path);
+	srv = make_server(&addr);
+	srv->logging = true;
+	run_server(srv);
+}
+
+static void client_send_msg(int sock, const struct message *msg)
+{
+	ssize_t ret;
+
+	ret = send(sock, msg, sizeof(*msg), 0);
+	if (ret < 0)
+		die_perror("failed to send data to server");
+}
+
+static void client_recv_reply(int sock, struct message *msg)
+{
+	struct pollfd fd = {
+		.fd = sock,
+		.events = POLLIN | POLLPRI,
+	};
+	ssize_t recvd;
+	int ret;
+
+	memset(msg, 0, sizeof(*msg));
+
+	ret = poll(&fd, 1, 10 * 1000);
+	if (ret < 0)
+		die_perror("failed while polling server for response");
+	if (ret == 0)
+		die("timeout while waiting for server to respond");
+
+	recvd = recv(sock, msg, sizeof(*msg), MSG_TRUNC);
+	if (recvd < 0)
+		die_perror("failed to receive data from server");
+	if (recvd == 0)
+		die("server disconnected unexpectedly");
+	if ((size_t)recvd != sizeof(*msg))
+		die("unexpected message size received from server");
+}
+
+static void client_recv_event(int sock, struct message *msg)
+{
+	ssize_t recvd;
+
+	recvd = recv(sock, msg, sizeof(*msg), MSG_TRUNC);
+	if (recvd < 0)
+		die_perror("failed to receive data from server");
+	if (recvd == 0)
+		die("server disconnected unexpectedly");
+	if ((size_t)recvd != sizeof(*msg))
+		die("unexpected message size received from server");
+}
+
+static void client_exchange(int sock, struct message *msg)
+{
+	client_send_msg(sock, msg);
+	client_recv_reply(sock, msg);
+}
+
+static void PRINTF(3, 4) client_validate_response(const struct message *msg,
+						  unsigned int expected,
+						  const char *fmt, ...)
+{
+	va_list va;
+
+	if (msg->type == MSG_TYPE_ERROR) {
+		va_start(va, fmt);
+		fprintf(stderr, "%s: ", get_prog_name());
+		vfprintf(stderr, fmt, va);
+		fprintf(stderr, ": %s\n", strerror(msg->err.errnum));
+		va_end(va);
+		exit(EXIT_FAILURE);
+	}
+
+	if (msg->type != expected)
+		die("server responded with unexpected message type: %d",
+		    msg->type);
+}
+
+static void print_request_help(void)
+{
+	printf("Usage: %s [GLOBAL OPTIONS] request [OPTIONS] <line>[=value]...\n",
+	       get_prog_name());
+	printf("\n");
+	printf("Request one or more GPIO lines, keeping them held by the daemon.\n");
+	printf("\n");
+	printf("Lines are specified by offset or by name if --by-name is set globally.\n");
+	printf("The chip must be identified with the global --chip option when lines are\n");
+	printf("specified by offset.\n");
+	printf("\n");
+	printf("In output mode, values may optionally be set per-line using the\n");
+	printf("'line=value' syntax. Values: '0'/'1', 'active'/'inactive', 'on'/'off'.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("  -i, --input\t\t\tset direction to input\n");
+	printf("  -o, --output\t\t\tset direction to output\n");
+	printf("      --open-drain\t\tset drive mode to open-drain (output only)\n");
+	printf("      --open-source\t\tset drive mode to open-source (output only)\n");
+	printf("      --push-pull\t\tset drive mode to push-pull (output only)\n");
+	printf("  -l, --active-low\t\ttreat the lines as active low\n");
+	printf("      --bias-disabled\t\tset the line bias to disabled\n");
+	printf("      --pull-down\t\tset the line bias to pull-down\n");
+	printf("      --pull-up\t\t\tset the line bias to pull-up\n");
+	printf("      --rising-edge\t\tmonitor rising edges (implies --input)\n");
+	printf("      --falling-edge\t\tmonitor falling edges (implies --input)\n");
+	printf("      --both-edges\t\tmonitor rising and falling edges (implies --input)\n");
+	printf("      --clock-hte\t\tuse HTE clock for edge event timestamps\n");
+	printf("      --clock-monotonic\t\tuse monotonic clock for edge event timestamps\n");
+	printf("      --clock-realtime\t\tuse realtime clock for edge event timestamps\n");
+	printf("  -p, --debounce-period <period>\n");
+	printf("\t\t\tdebounce the lines with the specified period\n");
+	printf("  -h, --help\t\t\tdisplay this help and exit\n");
+	print_period_help();
+}
+
+struct request_opts {
+	bool input;
+	bool output;
+	bool active_low;
+	bool pull_up;
+	bool pull_down;
+	bool bias_disabled;
+	bool push_pull;
+	bool open_drain;
+	bool open_source;
+	bool rising_edge;
+	bool falling_edge;
+	bool clock_monotonic;
+	bool clock_realtime;
+	bool clock_hte;
+	unsigned long long debounce_period_us;
+};
+
+static void validate_request_opts(const struct request_opts *opts)
+{
+	int clock_count = 0, drive_count = 0, bias_count = 0;
+
+	if (opts->input && opts->output)
+		die("--input and --output are mutually exclusive");
+
+	if ((opts->rising_edge || opts->falling_edge) && opts->output)
+		die("edge detection is only available in input mode");
+
+	drive_count += opts->push_pull;
+	drive_count += opts->open_drain;
+	drive_count += opts->open_source;
+	if (drive_count > 1)
+		die("--push-pull, --open-drain and --open-source are mutually exclusive");
+	if (drive_count > 0 && !opts->output)
+		die("--push-pull, --open-drain and --open-source are only available in output mode");
+
+	bias_count += opts->pull_up;
+	bias_count += opts->pull_down;
+	bias_count += opts->bias_disabled;
+	if (bias_count > 1)
+		die("--pull-up, --pull-down and --bias-disabled are mutually exclusive");
+
+	if (opts->clock_monotonic)
+		clock_count++;
+	if (opts->clock_realtime)
+		clock_count++;
+	if (opts->clock_hte)
+		clock_count++;
+
+	if (clock_count > 1)
+		die("--clock-monotonic, --clock-realtime and --clock-hte are mutually exclusive");
+
+	if (clock_count > 0 &&
+	    !opts->rising_edge && !opts->falling_edge)
+		die("--clock-* options require edge detection");
+
+	if (opts->debounce_period_us &&
+	    !opts->rising_edge && !opts->falling_edge)
+		die("--debounce-period requires edge detection");
+}
+
+static void parse_request_cmdline(int *argc, char ***argv,
+				  struct request_opts *opts, bool permute,
+				  void (*help_fn)(void))
+{
+	static const struct option longopts[] = {
+		{ "active-low",		no_argument,		NULL,	'l' },
+		{ "bias-disabled",	no_argument,		NULL,	'D' },
+		{ "both-edges",		no_argument,		NULL,	'E' },
+		{ "clock-hte",		no_argument,		NULL,	'H' },
+		{ "clock-monotonic",	no_argument,		NULL,	'M' },
+		{ "clock-realtime",	no_argument,		NULL,	'R' },
+		{ "debounce-period",	required_argument,	NULL,	'p' },
+		{ "falling-edge",	no_argument,		NULL,	'F' },
+		{ "help",		no_argument,		NULL,	'h' },
+		{ "input",		no_argument,		NULL,	'i' },
+		{ "open-drain",		no_argument,		NULL,	'N' },
+		{ "open-source",	no_argument,		NULL,	'S' },
+		{ "output",		no_argument,		NULL,	'o' },
+		{ "pull-down",		no_argument,		NULL,	'P' },
+		{ "pull-up",		no_argument,		NULL,	'U' },
+		{ "push-pull",		no_argument,		NULL,	'X' },
+		{ "rising-edge",	no_argument,		NULL,	'G' },
+		{ GETOPT_NULL_LONGOPT }
+	};
+	const char *shortopts = permute ? "lp:hio" : "+lp:hio";
+
+	int opti, optc;
+
+	optind = 0;
+
+	for (;;) {
+		optc = getopt_long(*argc, *argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case 'D':
+			opts->bias_disabled = true;
+			break;
+		case 'E':
+			opts->rising_edge = opts->falling_edge = true;
+			break;
+		case 'F':
+			opts->falling_edge = true;
+			break;
+		case 'G':
+			opts->rising_edge = true;
+			break;
+		case 'H':
+			opts->clock_hte = true;
+			break;
+		case 'i':
+			opts->input = true;
+			break;
+		case 'l':
+			opts->active_low = true;
+			break;
+		case 'M':
+			opts->clock_monotonic = true;
+			break;
+		case 'N':
+			opts->open_drain = true;
+			break;
+		case 'o':
+			opts->output = true;
+			break;
+		case 'p':
+			opts->debounce_period_us = parse_period_or_die(optarg);
+			break;
+		case 'P':
+			opts->pull_down = true;
+			break;
+		case 'R':
+			opts->clock_realtime = true;
+			break;
+		case 'S':
+			opts->open_source = true;
+			break;
+		case 'U':
+			opts->pull_up = true;
+			break;
+		case 'X':
+			opts->push_pull = true;
+			break;
+		case 'h':
+			help_fn ? help_fn() : print_request_help();
+			exit(EXIT_SUCCESS);
+		case '?':
+			die("try %s request --help", get_prog_name());
+		default:
+			abort();
+		}
+	}
+
+	*argc -= optind;
+	*argv += optind;
+}
+
+static void apply_opts_to_config(struct request_config *cfg,
+				 struct request_opts *opts,
+				 int argc, char **argv)
+{
+	int i, num_values = 0;
+	char *eq;
+
+	if ((opts->rising_edge || opts->falling_edge) && !opts->output)
+		opts->input = true;
+
+	/* GPIOD_LINE_VALUE_ERROR marks a line for which no value was given. */
+	for (i = 0; i < MAX_REQ_LINES; i++)
+		cfg->values[i] = GPIOD_LINE_VALUE_ERROR;
+
+	/* argv entries must be bare line names/offsets for line resolution. */
+	for (i = 0; i < argc; i++) {
+		eq = strchr(argv[i], '=');
+
+		if (eq) {
+			if (!opts->output)
+				die("output values can only be set in output mode");
+			cfg->values[i] = parse_line_value_or_die(eq + 1);
+			*eq = '\0';
+			num_values++;
+		}
+	}
+
+	if (num_values && num_values != argc)
+		die("if values are set, they must be set for all lines");
+
+	cfg->active_low = opts->active_low;
+
+	if (opts->pull_up)
+		cfg->bias = GPIOD_LINE_BIAS_PULL_UP;
+	else if (opts->pull_down)
+		cfg->bias = GPIOD_LINE_BIAS_PULL_DOWN;
+	else if (opts->bias_disabled)
+		cfg->bias = GPIOD_LINE_BIAS_DISABLED;
+
+	if (opts->push_pull)
+		cfg->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
+	else if (opts->open_drain)
+		cfg->drive = GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	else if (opts->open_source)
+		cfg->drive = GPIOD_LINE_DRIVE_OPEN_SOURCE;
+
+	if (opts->output)
+		cfg->direction = GPIOD_LINE_DIRECTION_OUTPUT;
+	else if (opts->input)
+		cfg->direction = GPIOD_LINE_DIRECTION_INPUT;
+
+	if (opts->rising_edge && opts->falling_edge)
+		cfg->edge = GPIOD_LINE_EDGE_BOTH;
+	else if (opts->rising_edge)
+		cfg->edge = GPIOD_LINE_EDGE_RISING;
+	else if (opts->falling_edge)
+		cfg->edge = GPIOD_LINE_EDGE_FALLING;
+
+	if (opts->clock_monotonic)
+		cfg->event_clock = GPIOD_LINE_CLOCK_MONOTONIC;
+	else if (opts->clock_realtime)
+		cfg->event_clock = GPIOD_LINE_CLOCK_REALTIME;
+	else if (opts->clock_hte)
+		cfg->event_clock = GPIOD_LINE_CLOCK_HTE;
+
+	if (opts->debounce_period_us)
+		cfg->debounce_period_us = opts->debounce_period_us;
+}
+
+static int request_main(int argc, char **argv, const struct config *cfg)
+{
+	struct message msg = { .type = MSG_TYPE_REQUEST };
+	struct line_resolver *resolver;
+	struct request *req = &msg.req;
+	struct request_opts opts = { };
+	int sock, i;
+
+	parse_request_cmdline(&argc, &argv, &opts, false, NULL);
+	validate_request_opts(&opts);
+
+	apply_opts_to_config(&req->cfg, &opts, argc, argv);
+
+	resolver = resolve_lines(argc, argv, cfg->chip_id, cfg->strict,
+				 cfg->by_name);
+	validate_resolution(resolver, cfg->chip_id);
+
+	if (resolver->num_chips > 1)
+		die("can only manipulate lines from one chip at a time");
+
+	if (!resolver->num_lines)
+		die("at least one line must be specified");
+
+	if (resolver->num_lines > MAX_REQ_LINES)
+		die("can only handle of up to %u lines", MAX_REQ_LINES);
+
+	snprintf(req->chip_path, sizeof(req->chip_path), "%s",
+		 resolver->chips[resolver->lines[0].chip_num].path);
+
+	snprintf(req->consumer, sizeof(req->consumer), "%s", cfg->consumer);
+
+	for (i = 0; i < resolver->num_lines; i++)
+		req->cfg.offsets[i] = resolver->lines[i].offset;
+	req->cfg.num_offsets = resolver->num_lines;
+
+	sock = get_connection(cfg->socket_path);
+
+	client_exchange(sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_REQ_OK, "unable to request lines");
+	printf("%s\n", msg.req_ok.req_name);
+
+	free_line_resolver(resolver);
+	close(sock);
+
+	return EXIT_SUCCESS;
+}
+
+static void parse_help_only(int *argc, char ***argv,
+			    void (*help)(void), const char *cmd)
+{
+	static const struct option longopts[] = {
+		{ "help", no_argument, NULL, 'h' },
+		{ GETOPT_NULL_LONGOPT }
+	};
+
+	int optc;
+
+	optind = 1;
+	while ((optc = getopt_long(*argc, *argv, "+h", longopts, NULL)) >= 0) {
+		switch (optc) {
+		case 'h':
+			help();
+			exit(EXIT_SUCCESS);
+		case '?':
+			die("try %s %s --help", get_prog_name(), cmd);
+		default:
+			abort();
+		}
+	}
+	*argc -= optind;
+	*argv += optind;
+}
+
+static void print_release_help(void)
+{
+	printf("Usage: %s [GLOBAL OPTIONS] release <request>\n", get_prog_name());
+	printf("\n");
+	printf("Release a GPIO line request held by the daemon.\n");
+	printf("\n");
+	printf("<request> is the name of a request as reported by the 'requests'\n");
+	printf("sub-command (e.g. 'request0'); the bare id ('0') is also accepted.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+}
+
+static bool try_parse_request_id(const char *arg, unsigned int *out)
+{
+	const char *s = arg;
+	unsigned long id;
+	char *end;
+
+	if (strncmp(s, "request", 7) == 0)
+		s += 7;
+	if (*s == '\0')
+		return false;
+
+	errno = 0;
+	id = strtoul(s, &end, 10);
+	if (errno || *end != '\0' || id > UINT_MAX)
+		return false;
+
+	*out = id;
+
+	return true;
+}
+
+static bool is_request_id(const char *arg)
+{
+	unsigned int id;
+
+	return try_parse_request_id(arg, &id);
+}
+
+static unsigned int parse_request_id(const char *arg)
+{
+	unsigned int id;
+
+	if (!try_parse_request_id(arg, &id))
+		die("invalid request name: '%s'", arg);
+
+	return id;
+}
+
+static int release_main(int argc, char **argv, const struct config *cfg UNUSED)
+{
+	struct message msg = { .type = MSG_TYPE_RELEASE };
+	unsigned int id;
+	int sock;
+
+	parse_help_only(&argc, &argv, print_release_help, "release");
+
+	if (argc < 1)
+		die("exactly one request must be specified, try %s release --help",
+		    get_prog_name());
+	if (argc > 1)
+		die("only one request can be released at a time");
+
+	id = parse_request_id(argv[0]);
+	msg.rel.id = id;
+
+	sock = get_connection(cfg->socket_path);
+
+	client_exchange(sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_OK,
+				 "unable to release request %u", id);
+	close(sock);
+
+	return EXIT_SUCCESS;
+}
+
+static int stop_main(int argc UNUSED, char **argv UNUSED,
+		     const struct config *cfg)
+{
+	struct message msg = { .type = MSG_TYPE_STOP };
+	int sock = get_connection(cfg->socket_path);
+
+	client_exchange(sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_OK, "unable to stop daemon");
+	close(sock);
+
+	return EXIT_SUCCESS;
+}
+
+static int ping_main(int argc UNUSED, char **argv UNUSED,
+		     const struct config *cfg)
+{
+	struct message msg = { .type = MSG_TYPE_PING };
+	int sock = get_connection(cfg->socket_path);
+
+	client_exchange(sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_OK, "unable to ping daemon");
+	close(sock);
+
+	return EXIT_SUCCESS;
+}
+
+static void print_request_info(const struct request_info *info, bool unquoted)
+{
+	unsigned int i;
+
+	printf("request%u (%s) consumer=%s%s%s offsets: [",
+	       info->id, info->chip_name,
+	       unquoted ? "" : "\"",
+	       info->consumer,
+	       unquoted ? "" : "\"");
+
+	for (i = 0; i < info->num_offsets; i++)
+		printf("%s%u", i ? ", " : "", info->offsets[i]);
+
+	printf("]\n");
+}
+
+static void print_requests_help(void)
+{
+	printf("Usage: %s [GLOBAL OPTIONS] requests\n", get_prog_name());
+	printf("\n");
+	printf("List all GPIO line requests currently held by the daemon.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("Use the global --unquoted option to suppress quoting of consumer names.\n");
+}
+
+static int requests_main(int argc, char **argv, const struct config *cfg)
+{
+	struct message msg = { .type = MSG_TYPE_REQ_LIST };
+	int sock;
+
+	parse_help_only(&argc, &argv, print_requests_help, "requests");
+
+	sock = get_connection(cfg->socket_path);
+
+	client_send_msg(sock, &msg);
+
+	for (;;) {
+		client_recv_reply(sock, &msg);
+
+		if (msg.type == MSG_TYPE_REQ_INFO) {
+			print_request_info(&msg.req_info, cfg->unquoted);
+			continue;
+		}
+
+		client_validate_response(&msg, MSG_TYPE_OK, "unable to list requests");
+		break;
+	}
+
+	close(sock);
+
+	return EXIT_SUCCESS;
+}
+
+static struct request_info *collect_req_infos(int sock, unsigned int *num_out)
+{
+	struct message msg = { .type = MSG_TYPE_REQ_LIST };
+	struct request_info *infos = NULL, *tmp;
+	unsigned int count = 0;
+
+	client_send_msg(sock, &msg);
+
+	for (;;) {
+		client_recv_reply(sock, &msg);
+
+		if (msg.type == MSG_TYPE_OK)
+			break;
+		if (msg.type != MSG_TYPE_REQ_INFO)
+			die("unexpected message type %d from daemon", msg.type);
+
+		tmp = realloc(infos, (count + 1) * sizeof(*infos));
+		if (!tmp)
+			die_oom();
+		infos = tmp;
+		infos[count++] = msg.req_info;
+	}
+
+	*num_out = count;
+	return infos;
+}
+
+struct resolved_name {
+	unsigned int req_id;
+	unsigned int offset;
+};
+
+static void resolve_names(const struct request_info *infos,
+			  unsigned int num_infos, int argc, char **argv,
+			  struct resolved_name *resolved)
+{
+	unsigned int i, j, k, num_names = argc;
+	bool found;
+
+	for (i = 0; i < num_names; i++) {
+		found = false;
+
+		for (j = 0; j < num_infos; j++) {
+			for (k = 0; k < infos[j].num_offsets; k++) {
+				if (infos[j].line_names[k][0] == '\0')
+					continue;
+				if (strcmp(infos[j].line_names[k], argv[i]) != 0)
+					continue;
+				if (found)
+					die("line '%s' is held by multiple requests",
+					    argv[i]);
+				found = true;
+				resolved[i].req_id = infos[j].id;
+				resolved[i].offset = infos[j].offsets[k];
+			}
+		}
+
+		if (!found)
+			die("no held request contains a line named '%s'", argv[i]);
+	}
+}
+
+static void print_get_help(void)
+{
+	printf("Usage: %s [GLOBAL OPTIONS] get <request-or-line>...\n",
+	       get_prog_name());
+	printf("\n");
+	printf("Read the current value of one or more GPIO lines or a request held by the daemon.\n");
+	printf("\n");
+	printf("Each argument is either:\n");
+	printf("  - a request name or bare id as reported by the 'requests' sub-command\n");
+	printf("    (all values are printed in offset order), or\n");
+	printf("  - one or more GPIO line names; each value is printed as \"name\"=value.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("\n");
+	printf("Use the global --unquoted option to suppress quoting of line names.\n");
+	printf("Use the global --numeric option to print bare 0/1 values instead of names.\n");
+}
+
+typedef void (*group_fn)(unsigned int, const unsigned int *, unsigned int, void *);
+
+static void for_each_request_group(const struct resolved_name *resolved,
+				   unsigned int n, group_fn fn, void *ctx)
+{
+	unsigned int pos[MAX_REQ_LINES], i, j, cnt;
+	bool done[MAX_REQ_LINES];
+
+	memset(done, 0, sizeof(done));
+
+	for (i = 0; i < n; i++) {
+		if (done[i])
+			continue;
+
+		cnt = 0;
+		for (j = i; j < n; j++) {
+			if (resolved[j].req_id == resolved[i].req_id) {
+				pos[cnt++] = j;
+				done[j] = true;
+			}
+		}
+		fn(resolved[i].req_id, pos, cnt, ctx);
+	}
+}
+
+struct get_group_ctx {
+	int sock;
+	const struct resolved_name *resolved;
+	enum gpiod_line_value *values;
+};
+
+static void get_group(unsigned int req_id, const unsigned int *pos,
+		      unsigned int cnt, void *data)
+{
+	struct message msg = {
+		.type = MSG_TYPE_GET,
+		.get_req.id = req_id,
+		.get_req.num_offsets = cnt,
+	};
+
+	struct get_group_ctx *ctx = data;
+	unsigned int j;
+
+	for (j = 0; j < cnt; j++)
+		msg.get_req.offsets[j] = ctx->resolved[pos[j]].offset;
+
+	client_exchange(ctx->sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_GET_OK,
+				 "unable to get line values for request %u",
+				 req_id);
+
+	for (j = 0; j < cnt; j++)
+		ctx->values[pos[j]] = msg.get_ok.values[j];
+}
+
+static void get_request(int sock, char **argv, const struct config *cfg)
+{
+	struct message msg = { .type = MSG_TYPE_GET };
+	unsigned int id, i;
+
+	id = parse_request_id(argv[0]);
+	msg.get_req.id = id;
+	msg.get_req.num_offsets = 0;
+
+	client_exchange(sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_GET_OK,
+				 "unable to get line values for request %u", id);
+
+	for (i = 0; i < msg.get_ok.num_values; i++) {
+		if (i)
+			putchar(' ');
+		if (cfg->numeric)
+			printf("%d", msg.get_ok.values[i]);
+		else
+			printf("%s", msg.get_ok.values[i] ==
+			       GPIOD_LINE_VALUE_ACTIVE ? "active" : "inactive");
+	}
+	printf("\n");
+}
+
+static void get_by_name(int sock, int argc, char **argv,
+			const struct config *cfg)
+{
+	unsigned int num_infos, num_names = argc, i;
+	struct get_group_ctx ctx;
+	struct resolved_name *resolved;
+	enum gpiod_line_value *values;
+	struct request_info *infos;
+
+	infos = collect_req_infos(sock, &num_infos);
+	resolved = malloc(num_names * sizeof(*resolved));
+	if (!resolved)
+		die_oom();
+
+	resolve_names(infos, num_infos, argc, argv, resolved);
+	free(infos);
+
+	values = malloc(num_names * sizeof(*values));
+	if (!values)
+		die_oom();
+
+	ctx.sock = sock;
+	ctx.resolved = resolved;
+	ctx.values = values;
+	for_each_request_group(resolved, num_names, get_group, &ctx);
+
+	for (i = 0; i < num_names; i++) {
+		if (i)
+			printf(" ");
+		if (cfg->numeric)
+			printf("%d", values[i]);
+		else
+			printf(cfg->unquoted ? "%s=%s" : "\"%s\"=%s", argv[i],
+			       values[i] == GPIOD_LINE_VALUE_ACTIVE ?
+			       "active" : "inactive");
+	}
+	printf("\n");
+
+	free(values);
+	free(resolved);
+}
+
+static int get_main(int argc, char **argv, const struct config *cfg)
+{
+	int sock;
+
+	parse_help_only(&argc, &argv, print_get_help, "get");
+
+	if (argc < 1)
+		die("request or line name must be specified, try %s get --help",
+		    get_prog_name());
+
+	sock = get_connection(cfg->socket_path);
+
+	if (is_request_id(argv[0])) {
+		if (argc > 1)
+			die("only one request can be queried at a time");
+		get_request(sock, argv, cfg);
+	} else {
+		get_by_name(sock, argc, argv, cfg);
+	}
+
+	close(sock);
+	return EXIT_SUCCESS;
+}
+
+static void print_set_help(void)
+{
+	printf("Usage: %s [GLOBAL OPTIONS] set <request> <value>...\n",
+	       get_prog_name());
+	printf("       %s [GLOBAL OPTIONS] set <request> <offset>=<value>...\n",
+	       get_prog_name());
+	printf("       %s [GLOBAL OPTIONS] set <line>=<value>...\n",
+	       get_prog_name());
+	printf("\n");
+	printf("Update the output values of GPIO lines or a request held by the daemon.\n");
+	printf("\n");
+	printf("The first form takes a request name or bare id and values for all lines\n");
+	printf("in the request in offset order (count must match).\n");
+	printf("The second form takes a request name or bare id and offset=value pairs\n");
+	printf("to update a subset of lines.\n");
+	printf("The third form takes one or more GPIO line names with values in\n");
+	printf("'name=value' syntax; name resolution is done by the client.\n");
+	printf("Accepted values: '0'/'1', 'active'/'inactive', 'on'/'off'.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+}
+
+struct set_group_ctx {
+	int sock;
+	const struct resolved_name *resolved;
+	const enum gpiod_line_value *values;
+};
+
+static void set_group(unsigned int req_id, const unsigned int *pos,
+		      unsigned int cnt, void *data)
+{
+	struct set_group_ctx *ctx = data;
+	struct message msg = {
+		.type = MSG_TYPE_SET,
+		.set_req.id = req_id,
+		.set_req.num_offsets = cnt,
+		.set_req.num_values = cnt,
+	};
+	unsigned int j;
+
+	for (j = 0; j < cnt; j++) {
+		msg.set_req.offsets[j] = ctx->resolved[pos[j]].offset;
+		msg.set_req.values[j] = ctx->values[pos[j]];
+	}
+
+	client_exchange(ctx->sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_OK,
+				 "unable to set line values for request %u",
+				 req_id);
+}
+
+static void set_by_name(int sock, int argc, char **argv)
+{
+	unsigned int num_infos, num_names = argc;
+	struct set_group_ctx ctx;
+	struct resolved_name *resolved;
+	enum gpiod_line_value *values;
+	struct request_info *infos;
+	char **names;
+
+	names = malloc(num_names * sizeof(*names));
+	values = malloc(num_names * sizeof(*values));
+	resolved = malloc(num_names * sizeof(*resolved));
+	if (!names || !values || !resolved)
+		die_oom();
+
+	parse_line_values_or_die(argc, argv, names, values);
+
+	infos = collect_req_infos(sock, &num_infos);
+	resolve_names(infos, num_infos, argc, (char **)names, resolved);
+	free(infos);
+
+	ctx.sock = sock;
+	ctx.resolved = resolved;
+	ctx.values = values;
+	for_each_request_group(resolved, num_names, set_group, &ctx);
+
+	free(names);
+	free(values);
+	free(resolved);
+}
+
+static void set_request(int sock, int argc, char **argv)
+{
+	struct message msg = { };
+	unsigned int id, i, cnt, num_args = argc;
+	bool offset_mode, has_eq;
+	unsigned long off;
+	const char *eq;
+	char *end;
+
+	if (argc < 2)
+		die("request and at least one value required, try %s set --help",
+		    get_prog_name());
+
+	eq = strchr(argv[1], '=');
+	offset_mode = (eq != NULL);
+
+	for (i = 1; i < num_args; i++) {
+		has_eq = (strchr(argv[i], '=') != NULL);
+		if (has_eq != offset_mode)
+			die("cannot mix positional values and offset=value pairs");
+	}
+
+	msg.type = MSG_TYPE_SET;
+	id = parse_request_id(argv[0]);
+	msg.set_req.id = id;
+
+	if (offset_mode) {
+		cnt = argc - 1;
+		if (cnt > MAX_REQ_LINES)
+			die("too many offset=value pairs specified");
+
+		for (i = 0; i < cnt; i++) {
+			eq = strchr(argv[i + 1], '=');
+			if (!eq)
+				die("expected offset=value, got '%s'", argv[i + 1]);
+			off = strtoul(argv[i + 1], &end, 10);
+			if (end != eq || off > UINT_MAX)
+				die("invalid offset in '%s'", argv[i + 1]);
+			msg.set_req.offsets[i] = (unsigned int)off;
+			msg.set_req.values[i] = parse_line_value_or_die(eq + 1);
+		}
+		msg.set_req.num_offsets = cnt;
+		msg.set_req.num_values = cnt;
+	} else {
+		cnt = argc - 1;
+		if (cnt > MAX_REQ_LINES)
+			die("too many values specified");
+
+		for (i = 0; i < cnt; i++)
+			msg.set_req.values[i] = parse_line_value_or_die(argv[i + 1]);
+
+		msg.set_req.num_offsets = 0;
+		msg.set_req.num_values = cnt;
+	}
+
+	client_exchange(sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_OK,
+				 "unable to set line values for request %u", id);
+}
+
+static int set_main(int argc, char **argv, const struct config *cfg)
+{
+	const char *eq;
+	int sock;
+
+	parse_help_only(&argc, &argv, print_set_help, "set");
+
+	if (argc < 1)
+		die("request and value or line=value required, try %s set --help",
+		    get_prog_name());
+
+	sock = get_connection(cfg->socket_path);
+
+	eq = strchr(argv[0], '=');
+	if (eq && !is_request_id(argv[0]))
+		set_by_name(sock, argc, argv);
+	else
+		set_request(sock, argc, argv);
+
+	close(sock);
+	return EXIT_SUCCESS;
+}
+
+static void print_monitor_help(void)
+{
+	printf("Usage: %s [GLOBAL OPTIONS] monitor [OPTIONS] <request-or-line>...\n",
+	       get_prog_name());
+	printf("\n");
+	printf("Monitor edge events on a GPIO line request held by the daemon.\n");
+	printf("\n");
+	printf("Each argument is either:\n");
+	printf("  - a request name or bare id as reported by the 'requests' sub-command\n");
+	printf("    (all edge events from that request are printed), or\n");
+	printf("  - one or more GPIO line names; events are filtered to those lines only.\n");
+	printf("    All named lines must belong to the same request.\n");
+	printf("The request must have been made with edge detection enabled.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("      --banner\t\t\tdisplay a banner on successful startup\n");
+	printf("  -F, --format <fmt>\t\tcustom output format (same specifiers as gpiomon,\n");
+	printf("\t\t\texcept %%l and %%c are not available)\n");
+	printf("  -h, --help\t\t\tdisplay this help and exit\n");
+	printf("  -I, --initial-state\t\tprint initial states of the lines\n");
+	printf("      --localtime\t\tformat timestamps as local time\n");
+	printf("  -n, --num-events <num>\texit after receiving num events\n");
+	printf("      --utc\t\t\tformat timestamps as UTC\n");
+	print_event_format_help(false);
+	printf("\n");
+	printf("The initial-state printout honors the global --numeric and --unquoted\n");
+	printf("options, the same as the 'get' sub-command.\n");
+}
+
+struct monitor_opts {
+	bool banner;
+	bool initial_state;
+	int num_events;
+	int timestamp_fmt;
+	const char *fmt;
+};
+
+static void parse_monitor_cmdline(int *argc, char ***argv,
+				  struct monitor_opts *opts)
+{
+	static const struct option longopts[] = {
+		{ "banner",		no_argument,		NULL,	'-' },
+		{ "format",		required_argument,	NULL,	'F' },
+		{ "help",		no_argument,		NULL,	'h' },
+		{ "initial-state",	no_argument,		NULL,	'I' },
+		{ "localtime",		no_argument,		NULL,	'L' },
+		{ "num-events",		required_argument,	NULL,	'n' },
+		{ "utc",		no_argument,		NULL,	'U' },
+		{ GETOPT_NULL_LONGOPT }
+	};
+	static const char *const shortopts = "+Fhn:I";
+
+	int opti, optc;
+
+	optind = 1;
+
+	for (;;) {
+		optc = getopt_long(*argc, *argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case '-':
+			opts->banner = true;
+			break;
+		case 'F':
+			opts->fmt = optarg;
+			break;
+		case 'I':
+			opts->initial_state = true;
+			break;
+		case 'L':
+			opts->timestamp_fmt = 2;
+			break;
+		case 'n':
+			opts->num_events = parse_uint_or_die(optarg);
+			break;
+		case 'U':
+			opts->timestamp_fmt = 1;
+			break;
+		case 'h':
+			print_monitor_help();
+			exit(EXIT_SUCCESS);
+		case '?':
+			die("try %s monitor --help", get_prog_name());
+		default:
+			abort();
+		}
+	}
+
+	*argc -= optind;
+	*argv += optind;
+}
+
+static unsigned int monitor_resolve(int sock, int argc, char **argv,
+				    struct resolved_name **resolved_out,
+				    unsigned int *num_filter_out)
+{
+	unsigned int num_infos, id, i, num_names = argc;
+	struct resolved_name *resolved;
+	struct request_info *infos;
+
+	if (is_request_id(argv[0])) {
+		if (argc > 1)
+			die("only one request can be monitored at a time");
+		*resolved_out = NULL;
+		*num_filter_out = 0;
+		return parse_request_id(argv[0]);
+	}
+
+	resolved = malloc(num_names * sizeof(*resolved));
+	if (!resolved)
+		die_oom();
+	infos = collect_req_infos(sock, &num_infos);
+	resolve_names(infos, num_infos, argc, argv, resolved);
+	free(infos);
+	id = resolved[0].req_id;
+	for (i = 1; i < num_names; i++) {
+		if (resolved[i].req_id != id)
+			die("lines belong to different requests");
+	}
+	*resolved_out = resolved;
+	*num_filter_out = num_names;
+	return id;
+}
+
+static int monitor_main(int argc, char **argv, const struct config *cfg)
+{
+	struct message msg = { .type = MSG_TYPE_MONITOR };
+	struct monitor_opts opts = { };
+	unsigned int num_filter, id, i;
+	struct resolved_name *resolved;
+	int events_done = 0, sock;
+	bool filter;
+
+	parse_monitor_cmdline(&argc, &argv, &opts);
+
+	if (argc < 1)
+		die("at least one request or line must be specified, try %s monitor --help",
+		    get_prog_name());
+
+	sock = get_connection(cfg->socket_path);
+
+	id = monitor_resolve(sock, argc, argv, &resolved, &num_filter);
+	filter = (num_filter > 0);
+
+	if (opts.initial_state) {
+		if (is_request_id(argv[0]))
+			get_request(sock, argv, cfg);
+		else
+			get_by_name(sock, argc, argv, cfg);
+		fflush(stdout);
+	}
+
+	msg.monitor_req.id = id;
+	client_send_msg(sock, &msg);
+	client_recv_reply(sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_OK,
+				 "unable to monitor request %u", id);
+
+	if (opts.banner) {
+		printf("Monitoring request%u...\n", id);
+		fflush(stdout);
+	}
+
+	for (;;) {
+		client_recv_event(sock, &msg);
+		if (msg.type != MSG_TYPE_EDGE_EVENT)
+			break;
+
+		if (filter) {
+			for (i = 0; i < num_filter; i++) {
+				if (resolved[i].offset == msg.edge_ev.offset)
+					break;
+			}
+			if (i == num_filter)
+				continue;
+		}
+
+		print_event(msg.edge_ev.timestamp_ns, msg.edge_ev.offset,
+			    msg.edge_ev.event_type, opts.timestamp_fmt,
+			    opts.fmt, NULL, NULL, false);
+		fflush(stdout);
+
+		events_done++;
+		if (opts.num_events && events_done >= opts.num_events)
+			break;
+	}
+
+	free(resolved);
+	close(sock);
+
+	return EXIT_SUCCESS;
+}
+
+static void print_reconfigure_help(void)
+{
+	printf("Usage: %s [GLOBAL OPTIONS] reconfigure [OPTIONS] <request> [line=value]...\n",
+	       get_prog_name());
+	printf("\n");
+	printf("Reconfigure an existing GPIO line request held by the daemon.\n");
+	printf("\n");
+	printf("<request> is the name or bare id as reported by the 'requests'\n");
+	printf("sub-command.\n");
+	printf("\n");
+	printf("In output mode, values may optionally be set per-line using the\n");
+	printf("'line=value' syntax. Values: '0'/'1', 'active'/'inactive', 'on'/'off'.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("  -i, --input\t\t\tset direction to input\n");
+	printf("  -o, --output\t\t\tset direction to output\n");
+	printf("      --open-drain\t\tset drive mode to open-drain (output only)\n");
+	printf("      --open-source\t\tset drive mode to open-source (output only)\n");
+	printf("      --push-pull\t\tset drive mode to push-pull (output only)\n");
+	printf("  -l, --active-low\t\ttreat the lines as active low\n");
+	printf("      --bias-disabled\t\tset the line bias to disabled\n");
+	printf("      --pull-down\t\tset the line bias to pull-down\n");
+	printf("      --pull-up\t\t\tset the line bias to pull-up\n");
+	printf("      --rising-edge\t\tmonitor rising edges (implies --input)\n");
+	printf("      --falling-edge\t\tmonitor falling edges (implies --input)\n");
+	printf("      --both-edges\t\tmonitor rising and falling edges (implies --input)\n");
+	printf("      --clock-hte\t\tuse HTE clock for edge event timestamps\n");
+	printf("      --clock-monotonic\t\tuse monotonic clock for edge event timestamps\n");
+	printf("      --clock-realtime\t\tuse realtime clock for edge event timestamps\n");
+	printf("  -p, --debounce-period <period>\n");
+	printf("\t\t\tdebounce the lines with the specified period\n");
+	printf("  -h, --help\t\t\tdisplay this help and exit\n");
+	print_period_help();
+}
+
+static int reconfigure_main(int argc, char **argv, const struct config *cfg)
+{
+	struct message msg = { .type = MSG_TYPE_RECONFIGURE };
+	struct request_opts opts = { };
+	unsigned int id;
+	int sock;
+
+	parse_request_cmdline(&argc, &argv, &opts, true, print_reconfigure_help);
+	validate_request_opts(&opts);
+
+	if (!argc)
+		die("request id required, try %s reconfigure --help", get_prog_name());
+
+	id = parse_request_id(argv[0]);
+	msg.reconfigure.id = id;
+	argc--;
+	argv++;
+
+	apply_opts_to_config(&msg.reconfigure.cfg, &opts, argc, argv);
+
+	sock = get_connection(cfg->socket_path);
+	client_exchange(sock, &msg);
+	client_validate_response(&msg, MSG_TYPE_OK,
+				 "unable to reconfigure request %u", id);
+	close(sock);
+
+	return EXIT_SUCCESS;
+}
+
+struct sub_command {
+	const char *name;
+	int (*sub_main)(int, char **, const struct config *);
+	const char *desc;
+};
+
+static const struct sub_command sub_cmds[] = {
+	{
+		.name = "debug",
+		.sub_main = debug_main,
+	},
+	{
+		.name = "ping",
+		.sub_main = ping_main,
+	},
+	{
+		.name = "stop",
+		.sub_main = stop_main,
+	},
+	{
+		.name = "request",
+		.sub_main = request_main,
+		.desc = "Request a set of GPIO lines.",
+	},
+	{
+		.name = "release",
+		.sub_main = release_main,
+		.desc = "Release a set of requested GPIO lines.",
+	},
+	{
+		.name = "requests",
+		.sub_main = requests_main,
+		.desc = "List the GPIO line requests held by the daemon.",
+	},
+	{
+		.name = "get",
+		.sub_main = get_main,
+		.desc = "Read the values of a held GPIO line request.",
+	},
+	{
+		.name = "set",
+		.sub_main = set_main,
+		.desc = "Update the values of a held GPIO line request.",
+	},
+	{
+		.name = "monitor",
+		.sub_main = monitor_main,
+		.desc = "Monitor edge events on a held GPIO line request.",
+	},
+	{
+		.name = "reconfigure",
+		.sub_main = reconfigure_main,
+		.desc = "Reconfigure the settings of a held GPIO line request.",
+	},
+	{ }
+};
+
+static void print_help(void)
+{
+	const struct sub_command *cmd;
+
+	printf("Usage: %s [GLOBAL OPTIONS] [SUB-COMMAND] [COMMAND OPTIONS] ...\n",
+	       get_prog_name());
+	printf("\n");
+	printf("Simple swiss-army knife for controlling GPIOs with persistence\n");
+	printf("support.\n");
+	printf("\n");
+	printf("Commands:\n");
+	for (cmd = sub_cmds; cmd->name; cmd++) {
+		if (cmd->desc)
+			printf("  %s - %s\n", cmd->name, cmd->desc);
+	}
+	printf("\n");
+	printf("Options:\n");
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -C, --consumer <name>\tconsumer name applied to requested lines\n");
+	printf("\t\t\t(default is 'gpioctl')\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -N, --numeric\t\tdisplay line values as '0' (inactive) or '1' (active)\n");
+	printf("  -p, --socket-path <path>\n");
+	printf("\t\t\tpath to the unix-domain socket used for\n");
+	printf("\t\t\tcommunication between client and server\n");
+	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
+	printf("      --unquoted\tdon't quote line or consumer names\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
+}
+
+static void parse_global_cmdline(int *argc, char ***argv, struct config *cfg)
+{
+	static const struct option longopts[] = {
+		{ "by-name",		no_argument,		NULL,	'B' },
+		{ "chip",		required_argument,	NULL,	'c' },
+		{ "consumer",		required_argument,	NULL,	'C' },
+		{ "help",		no_argument,		NULL,	'h' },
+		{ "numeric",		no_argument,		NULL,	'N' },
+		{ "socket-path",	required_argument,	NULL,	'p' },
+		{ "strict",		no_argument,		NULL,	's' },
+		{ "unquoted",		no_argument,		NULL,	'Q' },
+		{ "version",		no_argument,		NULL,	'v' },
+		{ GETOPT_NULL_LONGOPT },
+	};
+	static const char *const shortopts = "+hvNc:sC:Bp:Q";
+
+	int opti, optc;
+
+	for (;;) {
+		optc = getopt_long(*argc, *argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case 'B':
+			cfg->by_name = true;
+			break;
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
+		case 'C':
+			cfg->consumer = optarg;
+			break;
+		case 'N':
+			cfg->numeric = true;
+			break;
+		case 'p':
+			cfg->socket_path = optarg;
+			break;
+		case 'Q':
+			cfg->unquoted = true;
+			break;
+		case 's':
+			cfg->strict = true;
+			break;
+		case 'h':
+			print_help();
+			exit(EXIT_SUCCESS);
+		case 'v':
+			print_version();
+			exit(EXIT_SUCCESS);
+		case '?':
+			die("try %s --help", get_prog_name());
+		default:
+			abort();
+		}
+	}
+
+	*argc -= optind;
+	*argv += optind;
+
+	if (!*argc)
+		die("sub-command is required, try %s --help", get_prog_name());
+}
+
+static const struct sub_command *find_sub_cmd(const char *name)
+{
+	const struct sub_command *cmd;
+
+	for (cmd = sub_cmds; cmd->name; cmd++) {
+		if (strcmp(name, cmd->name) == 0)
+			return cmd;
+	}
+
+	return NULL;
+}
+
+int main(int argc, char **argv)
+{
+	struct config cfg = { .consumer = "gpioctl" };
+	const struct sub_command *subcmd;
+
+	set_prog_name(argv[0]);
+	parse_global_cmdline(&argc, &argv, &cfg);
+
+	subcmd = find_sub_cmd(argv[0]);
+	if (!subcmd)
+		die("invalid sub-command, try %s --help", get_prog_name());
+
+	return subcmd->sub_main(argc, argv, &cfg);
+}
diff --git a/tools/meson.build b/tools/meson.build
index 5ecf7dc5d221d52243478f9a126e6512d2408981..70c4d2fe5484e5621da2184bd6af2041b4fd8de3 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -46,8 +46,18 @@ if opt_gpioset_interactive.allowed() and libedit_dep.found()
   tools_deps += [libedit_dep]
 endif
 
+tools = [
+  'gpiodetect',
+  'gpioinfo',
+  'gpioget',
+  'gpioset',
+  'gpiomon',
+  'gpionotify',
+  'gpioctl'
+]
+
 tools_exes = {}
-foreach tool : ['gpiodetect', 'gpioinfo', 'gpioget', 'gpioset', 'gpiomon', 'gpionotify']
+foreach tool : tools
   tools_exes += {tool: executable(tool,
     sources: [tool + '.c'],
     include_directories: libgpiod_inc,
@@ -56,3 +66,12 @@ foreach tool : ['gpiodetect', 'gpioinfo', 'gpioget', 'gpioset', 'gpiomon', 'gpio
     install: true,
   )}
 endforeach
+
+if tests_enabled
+  executable('gpioctl-test-helper',
+    sources: ['gpioctl-test-helper.c'],
+    include_directories: libgpiod_inc,
+    dependencies: tools_deps,
+    install: false,
+  )
+endif
diff --git a/tools/tools-common.c b/tools/tools-common.c
index d6cfcb4fd6b1aa24b201556dbeab9f095b1bf5f0..0f98f40696d738744c7ce870c2961b8a0018e272 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -97,7 +97,7 @@ void print_version(void)
 {
 	printf("%s v%s (libgpiod v%s)\n",
 	       get_prog_short_name(), GPIOD_VERSION_STR, gpiod_api_version());
-	printf("Copyright (C) 2017-2023 Bartosz Golaszewski\n");
+	printf("Copyright (C) 2017-2026 Bartosz Golaszewski\n");
 	printf("License: GPL-2.0-or-later\n");
 	printf("This is free software: you are free to change and redistribute it.\n");
 	printf("There is NO WARRANTY, to the extent permitted by law.\n");

-- 
2.47.3

