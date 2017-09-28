#include <linux/init.h>
#include <linux/module.h>

MODULE_LICENSE("GPL");

__init void ex04_simple_module_fun1(void)
{
	printk(KERN_ALERT "Inside the %s function\n", __FUNCTION__);
}

void ex04_simple_module_fun2(void)
{
	printk(KERN_ALERT "Inside the %s function\n", __FUNCTION__);
}

__initdata int count = 5;

__init int ex04_simple_module_init(void)
{
	int index = 0;
	printk(KERN_ALERT "Inside the %s function\n", __FUNCTION__);
	for(index = 0; index < count; index++)
	{
		printk(KERN_ALERT "Index = %d\n", index);
	}

	ex04_simple_module_fun1();
	ex04_simple_module_fun2();

	return 0;
}

void ex04_simple_module_exit(void)
{
	printk(KERN_ALERT "Inside the %s function\n", __FUNCTION__);

	ex04_simple_module_fun2();
}

module_init(ex04_simple_module_init);
module_exit(ex04_simple_module_exit);
