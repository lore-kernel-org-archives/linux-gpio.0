Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743148;
	b=nLQ87zRlpeCL87+9kp/NN5WKru8Yq2akNaydP7S1egsW00gNbqjDNl4Hq/47x+oQwId+
	 NycBnXZu7w8SCUoCag7YgztV4KoTZ2ApKJYO2oK9KvXTjyKXjmQBMmpKzfoBSCm+i1dNh
	 AbnhXxvCQFm1ZyzrccaXM9P4KuvJEnOz2DQqOOknyArTqBBK+e+tzIb/rZuGD9b+EYzYp
	 CrRsJd/2ZRjJjuaqrpZ8Q1OpV46WLLUl/3422CrwgRnr2WwE4I2GQgQajjxbtj3iuj0TA
	 9sdzc64dv+s47smSH+eRtLan6Kq1m9NwGJMdVsuZnGZP93/5nESfYI2JCg731i0w+yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CPyIasDL6N4C/azsvbD6uPPZQy92j0Qp5qdKw7LIm80=;
	b=sEmqH/IL3xm2vHLVWh0c72ZwQeIQ+3/dGzo9teOWjeMqVg7DbyQvfC/p9ZBXCdlstDHO
	 pvfXlgMnvlhXV+j/dbbXP2T7rNRYH+OioyS7LNE+bDBQraizaGEGEr857W/FYBnMeVEGM
	 /l++nMwGZWLeA/NWNbR92+/9TlY8BUe68Rnk4RwwqMFcY8yh6NcnReY3CA19/XFFRE4jF
	 GhzJuaEeuiUr6fIYfljVZneu+BfkaaV5SkaVQATmQTfgwoC9gWiB7K+4b/L8+hJi9LVTH
	 HqrNdC6DPFP9T9ToZhaYeZVac3FPTO+1MdU6sR4tLwJpI0H+LW5JbTtVBHydN3EZ5sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jPbWU0Og;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUdmODBM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E466D606A31A
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 08:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E466D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jPbWU0Og;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUdmODBM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FMw21552424
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 08:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CPyIasDL6N4C/azsvbD6uP
	PZQy92j0Qp5qdKw7LIm80=; b=jPbWU0OgwZp8pLoXez+nCVH/64467llFxJtd8o
	BAgBscR2ThqftjvLCW8oJtQQBODbooF5sIQXDlcn8TI0RV0ocVroqYECY6NAaI4A
	xlGZKGx9FxPIA+SQeqsEktvI2+c4Hfb4MjTFGk+oVpuj6LlBCNCvpBgLTXfPmwUT
	xHWv9kB+VzUB0UB56G+NMWne+N4nM5t2vt3LHN96TlCv3wUnRDl3ffphAUg63h3h
	rqeTRLttkzDErdGt8mmJPtQQSqa/KxVXHHxIeHeqjneJmQ+HqllHUxsuZFYTjNb+
	GFZIZcP7Nc7cXOVvfqUGzJbGjxXy7uwPsyWs+lEJninTiNMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttn75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 08:12:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so133701785a.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 01:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743146; x=1793347946; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CPyIasDL6N4C/azsvbD6uPPZQy92j0Qp5qdKw7LIm80=;
        b=bUdmODBMsdWmqvTtl47bgME7j+wi3xFI7TZo71p5dDWkG1e4VC5h769ppCjgkz4DnH
         /omYiqFLf+tjQQtzMm5iaf5SxyFRikasH0OT8ytny60zBVcjV07i1XjhqWKuIbd9Z8C0
         tz7gy0a47+o+YH8PCFBto1hE8iOKQuoYKYRWMK9oqpmxQ4M3fYvdVcyA0533s8dI4xCB
         fgo4Foakgi0vgdQ51hqHexZCc057XrnYoDwHU7rtAk6o8NDhGt2nnfBrr1uFNFizLZxa
         cpyoRr1NviPF6GNCqYi7QfhZm4pU5qz9Gsx3pvUtCq8gxUanB8ccxP35PSxWdDKmQq7m
         2sEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743146; x=1793347946;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CPyIasDL6N4C/azsvbD6uPPZQy92j0Qp5qdKw7LIm80=;
        b=v/7+LgXDCdojykDLwLPCWSpMlNl9O/5tZZbQFJ4g8bjFulQrp//ZJ9/F9YfqOCTTV4
         /ug2XoMZHw24taDLYG1hEvt46QeXUoZFWuk32mXzB5Q/TwGNc9Yah/dh7EKeHPg6ta7z
         6hCKf+/qKptc5XAyu8nVvEkpx4Ts4/8LQr/1Ab+1N6XLdvv57yyoXBoQcE8Du9ZtvBph
         FE1GNdV/oUOJWW+H/RffquPcRGot/6SRdzqhFhvzv3xmhgsbAtEJB2ZqpJCIaIJIRW8d
         lOOzvN8ogAmisiirJ4C6Im9DP6NyxC3iBkb+3a2CqW3Z6Dh65DlG3VmIyUUEaIp7iAVh
         9IrA==
X-Gm-Message-State: AFq9FYJEZwStYEFmxaC5U2i2vIln2kEGLP72mP5Q/NgA4a98OSvZ+Zcp
	+QMdDPfTflOpDyx8wUboD6KSKeWnM44ETltmnESC1rJhpgYAQXjXHl1tyi8af+wvASrBe2+Ooh6
	tAFvYT/hQkE6zocyv3wAkW2TSJxVZ0FeXQsTUaXjfE2tNozQ888Xhmmkimrutv1c3
X-Gm-Gg: AYBFou3noH0NnLlAqtnZtx9UUxlVql7vGjaDR4M0IFEGmYvVJ19wdPt2gTX/LIL/rP1
	h5kk6Oh7kWkn36FFnSFy/P0wbCe44VDkMeN2+PphGFpC8TNRofzvCCa2fUDzuE/guP1BrchhTj7
	ThzeU7GHCFdWUVx456EsXgc6Rfe1PPPqAlunkHXTOJcvdy1R58FeJm42y1F4kXN7soZPNIFeUWc
	JR9xsRiyU4Z/sSSWbtP6sS1ctZYK533FQ9p1HCRIDHAQn1NFmt5ftxq5zazgolcYdL9jT/WBjZ/
	tQs4GrYyoRAkHomsYVfhMe1cluIJwpoGY8VsBrUjyq/ZY2Ry2Y1hauIiwcKiXND0m9gCNjNWqFB
	7TMGfLBiHkrM1qWs4CXNe7K99X83N
X-Received: by 2002:a05:620a:439e:b0:939:7683:33d5 with SMTP id af79cd13be357-93f6f79bc6emr278261685a.19.1792743145910;
        Fri, 23 Oct 2026 01:12:25 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:939:7683:33d5 with SMTP id af79cd13be357-93f6f79bc6emr278259185a.19.1792743145379;
        Fri, 23 Oct 2026 01:12:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm68158805e9.8.2026.10.23.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:12:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:12:12 +0200
Subject: [PATCH libgpiod] build: restore function and header checks in
 meson build
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-meson-func-hdr-checks-v1-1-f7480334e012@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANsW22oC/x3MwQqDMAyA4VeRnA1omOJ8FfFQ02jDtlYaNgbiu
 1s8fof/P8AkqxiM1QFZfmqaYkFbV8DBxU1QfTFQQ33bEOFHLEVcv5Ex+IwchF+G3dIP7B7uSd0
 Apd2zrPq/vxO8ddl2TR7m87wAPZ78+nEAAAA=
X-Change-ID: 20261022-meson-func-hdr-checks-5b68ca4a9258
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3320;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=g73DPqE/kEfPpcYqlAsUo4m4CymhJMeGBTH2sfN5EiE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2xbiL73RuGblRFg/QmMN7Y1u9fLOwQHErxaNs
 tccpbnDIPmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsW4gAKCRAFnS7L/zaE
 w0LYEACIL+AJ88oXKmj2ahyK+FhaVome1QU31922E+L2/z0tQ7FxowCxGJMTEDAJMQjhjD2DlUh
 cRUHG5SGjBRrVEYZ49M/BpIpsCYrS7X+yOQltSmHSiJ+R4SYsuvg9ady32HFF34sGtbcdjATnyo
 hGyXUdKRijFgmKXwaRQ/6odOoUV1P5wT9TEsMSrA5mZ/3ai8wX3oRPtBGrDKYIX+OM361/DK9Dl
 1rFhnt/C6Yfu0bVm2FTe9qTaGIITCcgnABfhFbY3jV3MgPyRm10xiPLZe8lWKNXDjzP/7mP2U++
 g3l9d6a6B5kqeg+nFKXDNS0TbTveePjqXRB8a5U9M/6nu+PvHtpOJsffQE06KJdsDQbLaICPE5X
 VyO2v9hFRmHnbH+3UmzrsLYCCka1g6whKkpIlc0sAa0jD14nXyubvcZyuVVAQXnyuAI+nMZHWRT
 jiEMklCAIhVafdEoO88+oNgE7jn44gJDEPSJXFvegxC9Hj9TrXUdaKVEWAqYnD4M1WY0o5c+59e
 RLRq/krkBACKEJcxvkBy9q5t9sn30idAcHT6BpNb/oSp7uEMkj8xh+BaxLrzKh/SzWs+pqGfNVW
 7Q4GQugHYuFlsprG5GMPqBmQ6e69e+DLZsf7C81H75TWT/CmzXadpkrrwIWKBIvXBTIM1vqkWa9
 ia3JLeZXNXeypwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb16ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MnWH6L30y1vDSSXWxzIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: EbJm8VDlBNUkNBQUfGwsOzwaKwoYZFxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXxTKvONAQCmvf
 mc1sSJzvRxYOxRkN8M4/ZidB1iCgHZ/KDiyYPoUFmrPU+HbxKrCZn3Jd1nBPJ57ZN+srMH3dnPW
 bXSShXPz66yjB5ryPf5T2VNaC3US2Cz0ZJX0PoxNw+ahAikTEX8owUayp9DguUogGjgZz3aUwZH
 fU24kmTEma7m4aPvLLK8CMnFqzWLzdLnlP6B7v+VAbCGR8PE9nifcvPAq2cqcH6tk6vq/QxJqzW
 trJyQRqYNBgZylNEqf1GUc6dhvO+bQBJa544hX/7GWSFCXDTTWe8vwINuOcYaJcx8QzBVn/WDKC
 sKml8IJf6RKNX52ONzbILA9QsgSaP4tp0eKbLuvsfEns2dk88UApMoUlKa0/GLyQD1d08svPfrB
 ADw2dPz1PGW3Y2tFjht6ml6e1sI1L0zwYJDtqXWxiQKgtupex1geJApejbuEF2mSJy/2wyTOQNc
 kFguMoFBn3X9PKGLUjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX7ddVRs6+WNFX
 0dSG0jGPaB4kP+VFzifOUvzfrWnvq22CrWPFiduNh3r2n3XQwakz1PPmaTenBk9VSLN3KEgavJV
 QhlQWBYUzrmXFpKqCGt6K4UfS+CAPU4=
X-Proofpoint-ORIG-GUID: EbJm8VDlBNUkNBQUfGwsOzwaKwoYZFxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032

The conversion from autotools to meson dropped the AC_CHECK_FUNC() and
AC_CHECK_HEADERS() checks from configure.ac. As a result, a missing libc
function or header is no longer caught at configuration time and instead
shows up as an obscure compilation or linking error later on.

Bring the checks back using compiler.has_function() and
compiler.check_header(). Keep the same grouping as before: library
checks are always done, tools, tests and D-Bus daemon checks only when
the respective component is enabled. The pthread library check is not
restored as it's already covered by the threads dependency.

_GNU_SOURCE needs to be passed explicitly as project arguments are not
used by the compiler checks.

Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 meson.build | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/meson.build b/meson.build
index 7045d29f5fac049d67ef50627712e338643ecff0..3e95f9f5eba261dd4d54d3b39aae80d831133aad 100644
--- a/meson.build
+++ b/meson.build
@@ -182,6 +182,92 @@ endif
 
 help2man = find_program('help2man', required: false)
 
+cc = meson.get_compiler('c')
+
+lib_headers = [
+  'fcntl.h',
+  'getopt.h',
+  'dirent.h',
+  'poll.h',
+  'sys/sysmacros.h',
+  'sys/ioctl.h',
+  'sys/param.h',
+  'sys/stat.h',
+  'sys/types.h',
+  'linux/const.h',
+  'linux/ioctl.h',
+  'linux/types.h',
+]
+lib_funcs = {
+  'ioctl': 'sys/ioctl.h',
+  'open': 'fcntl.h',
+  'close': 'unistd.h',
+  'read': 'unistd.h',
+  'ppoll': 'poll.h',
+  'realpath': 'stdlib.h',
+  'readlink': 'unistd.h',
+}
+
+tools_funcs = {
+  'daemon': 'unistd.h',
+  'asprintf': 'stdio.h',
+  'scandir': 'dirent.h',
+  'versionsort': 'dirent.h',
+  'strtoull': 'stdlib.h',
+  'nanosleep': 'time.h',
+}
+
+tests_headers = [
+  'sys/utsname.h',
+  'sys/mount.h',
+  'sys/prctl.h',
+  'sys/random.h',
+  'linux/version.h',
+  'pthread.h',
+]
+tests_funcs = {
+  'atexit': 'stdlib.h',
+  'asprintf': 'stdio.h',
+  'prctl': 'sys/prctl.h',
+  'unlink': 'unistd.h',
+  'unlinkat': 'unistd.h',
+  'openat': 'fcntl.h',
+  'mkdirat': 'sys/stat.h',
+  'write': 'unistd.h',
+  'twalk': 'search.h',
+  'tsearch': 'search.h',
+  'tdestroy': 'search.h',
+  'tdelete': 'search.h',
+  'setrlimit': 'sys/resource.h',
+}
+
+dbus_funcs = {
+  'daemon': 'unistd.h',
+  'strverscmp': 'string.h',
+}
+
+check_headers = lib_headers
+check_funcs = lib_funcs
+if opt_tools.allowed()
+  check_funcs += tools_funcs
+endif
+if tests_enabled
+  check_headers += tests_headers
+  check_funcs += tests_funcs
+endif
+if dbus_enabled
+  check_funcs += dbus_funcs
+endif
+
+foreach hdr : check_headers
+  cc.check_header(hdr, args: '-D_GNU_SOURCE', required: true)
+endforeach
+
+foreach func, hdr : check_funcs
+  cc.has_function(func, prefix: '#include <@0@>'.format(hdr),
+                  args: '-D_GNU_SOURCE', required: true)
+endforeach
+
 subdir('include')
 subdir('lib')
 

---
base-commit: c2e9287333d7be588b3acaed7bbb1c58d7b551be
change-id: 20261022-meson-func-hdr-checks-5b68ca4a9258

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

